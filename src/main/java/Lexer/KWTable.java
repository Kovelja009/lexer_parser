package Lexer;

import Parser.sym;

import java.util.Hashtable;

public class KWTable {

	private Hashtable mTable;
	public KWTable()
	{
		// Inicijalizcaija hash tabele koja pamti kljucne reci
		mTable = new Hashtable();
		mTable.put("in_the_beginning_there_was_nothing", Integer.valueOf(sym.in_the_beginning));
		mTable.put("real", Integer.valueOf(sym.real));
		mTable.put("int", Integer.valueOf(sym._int));
		mTable.put("char", Integer.valueOf(sym._char));
		mTable.put("boolean", Integer.valueOf(sym._bool));
		mTable.put("read", Integer.valueOf(sym.read));
		mTable.put("show", Integer.valueOf(sym.write));
		mTable.put("while", Integer.valueOf(sym._while));
		mTable.put("truth", Integer.valueOf(sym.CONST));
		mTable.put("lie", Integer.valueOf(sym.CONST));
		mTable.put("trial", Integer.valueOf(sym.IF));
		mTable.put("spare", Integer.valueOf(sym.ELSE));
		mTable.put("betray", Integer.valueOf(sym.BREAK));
		mTable.put("heal", Integer.valueOf(sym.CONTINUE));
		mTable.put("alpha", Integer.valueOf(sym.BEGIN));
		mTable.put("omega", Integer.valueOf(sym.END));
		mTable.put("return", Integer.valueOf(sym.RETURN));
		mTable.put("string", Integer.valueOf(sym.STRING));
               

	}

	
	/**
	 * Vraca ID kljucne reci 
	 */
	
	public int find(String keyword)
	{
		Object symbol = mTable.get(keyword);
		if (symbol != null)
			return ((Integer)symbol).intValue();
		
		// Ako rec nije pronadjena u tabeli kljucnih reci radi se o identifikatoru
		return sym.ID;
	}
	

}
