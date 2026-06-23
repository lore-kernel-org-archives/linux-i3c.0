Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0F7CDB46F
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Jun 2026 14:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37CkLzOQ8O6QJ9JrTQZYJ271ko8GwkDtUOfXeGDhVtc=; b=flfHuChc6vBMgy
	/yRJHrqUWscIH8rvQIIv5uzooKWKjOtGT/tPu6k+g3SSlki21ozzG2PbxzIj4+s6jZLsrsIRQco33
	lrVqJT8pFrIlwAUylOHbUhIBlxxhZRS82jYDzNIaNXp242OwGsw4HwBVPz2r1VSMCMAz4UEKFGhkT
	U4+ILnT9VZgoKw36pDqzhENTuF0cG2Mc4AoIN9FQ2rpMzFV+RvCqqaxsZRLE1DW0zrQ578DBeE6Ay
	qdPJEgmCfl0MyAkPOhGe5Pw1KjofvG50TYsOK/Nsn+rM2GIKvkBLOPkrmEFx3WeE53n/7KsAGjarQ
	rvlJh7okhuFSBLls58hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2Ef-00000006T0y-2gvR;
	Tue, 23 Jun 2026 14:36:21 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2Ec-00000006Szv-3Se6
	for linux-i3c@lists.infradead.org;
	Tue, 23 Jun 2026 14:36:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3D02F1A088E;
	Tue, 23 Jun 2026 14:36:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D42A601C2;
	Tue, 23 Jun 2026 14:36:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E685106C81A8;
	Tue, 23 Jun 2026 16:36:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782225375; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XN/oCCtTlAUMlzvR/ND+JEuvFxFzXtyhJLOVUoMX9dg=;
	b=WjRv8YwpibYry8BB21VP4LUEK2UfVlRqxHc0hcVpvFQkYo4IJpdfZnX0rWJq0UokY1WtOs
	fmzHKydS0nK8wZcMKKKfl/T+4mSmIDyqOe4qzeXbo22i4gu4WV6CxaOyXv0G/fqhDEjUl6
	sPMZZWZRNrwTKcTlVqCYy58M+saIsqeDXJqAkv6FPqjWtEC/pX0mJuF2JSUQ4qCVLBrdOf
	oIkR5HCBbkLFtteDeSUUrShvMdxdVFXxAeLmgwcFfGJ4t6C6NL4lEUkbRxNk6XPHbyIyWv
	xjKg23HnoAfGIbQhfa1cit6105OWqWWGKdZeMgopbp3QbprGbhDWWA049vommQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  linux-i3c@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: i3c: master: svc: IBI payload not bounded by max_payload_len
In-Reply-To: <178220265899.2552261.12288525775100092849@maoyixie.com> (Maoyi
	Xie's message of "Tue, 23 Jun 2026 16:17:38 +0800")
References: <178220265899.2552261.12288525775100092849@maoyixie.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 23 Jun 2026 16:36:13 +0200
Message-ID: <87mrwlmihu.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_073618_996479_2C5DF2E8 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAyMy8wNi8yMDI2IGF0IDE2OjE3OjM4ICswOCwgTWFveWkgWGllIDxtYW95aXhpZS50
anVAZ21haWwuY29tPiB3cm90ZToKCj4gSGkgYWxsLAo+Cj4gSSB0aGluayBzdmNfaTNjX21hc3Rl
cl9oYW5kbGVfaWJpKCkgaW4gZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiBj
YW4gd3JpdGUgcGFzdCB0aGUgSUJJIHNsb3QgYnVmZmVyIHdoZW4gYSBkZXZpY2Ugc2VuZHMgYSBs
YXJnZSBJQkkgcGF5bG9hZC4KPiBJIHdvdWxkIGFwcHJlY2lhdGUgaXQgaWYgeW91IGNvdWxkIGxl
dCBtZSBrbm93IHdoZXRoZXIgeW91IGFncmVlLgo+Cj4gVGhlIHJlYWQgbG9vcCBib3VuZHMgdGhl
IHNsb3Qgb25seSBieSB0aGUgaGFyZHdhcmUgRklGTyBzaXplLCBub3QgYnkgdGhlCj4gcmVxdWVz
dGVkIG1heF9wYXlsb2FkX2xlbi4KPgo+IAlzbG90LT5sZW4gPSAwOwo+IAlidWYgPSBzbG90LT5k
YXRhOwo+IAl3aGlsZSAoU1ZDX0kzQ19NU1RBVFVTX1JYUEVORCguLi4pICYmIHNsb3QtPmxlbiA8
IFNWQ19JM0NfRklGT19TSVpFKSB7Cj4gCQltZGF0YWN0cmwgPSByZWFkbChtYXN0ZXItPnJlZ3Mg
KyBTVkNfSTNDX01EQVRBQ1RSTCk7Cj4gCQljb3VudCA9IFNWQ19JM0NfTURBVEFDVFJMX1JYQ09V
TlQobWRhdGFjdHJsKTsKPiAJCXJlYWRzYihtYXN0ZXItPnJlZ3MgKyBTVkNfSTNDX01SREFUQUIs
IGJ1ZiwgY291bnQpOwo+IAkJc2xvdC0+bGVuICs9IGNvdW50Owo+IAkJYnVmICs9IGNvdW50Owo+
IAl9Cj4KPiBzbG90LT5kYXRhIHBvaW50cyBpbnRvIHRoZSBJQkkgcG9vbC4gaTNjX2dlbmVyaWNf
aWJpX2FsbG9jX3Bvb2woKSBzaXplcyBlYWNoCj4gc2xvdCBhdCBtYXhfcGF5bG9hZF9sZW4uIHN2
Y19pM2NfbWFzdGVyX3JlcXVlc3RfaWJpKCkgb25seSByZWplY3RzIGEKPiBtYXhfcGF5bG9hZF9s
ZW4gYWJvdmUgU1ZDX0kzQ19GSUZPX1NJWkUgKDE2KS4gU28gYSBkcml2ZXIgY2FuIGFzayBmb3Ig
YSBzbWFsbAo+IHdpbmRvdywgYW5kIG1jdHAtaTNjIGFza3MgZm9yIDEuIGNvdW50IGNvbWVzIGZy
b20gdGhlIGNvbnRyb2xsZXIgUlhDT1VOVAo+IGZpZWxkIGFuZCBjYW4gYmUgdXAgdG8gMzEuIFRo
ZSBsb29wIHN0b3BzIGF0IFNWQ19JM0NfRklGT19TSVpFLCBub3QgYXQgdGhlCj4gd2luZG93LiBB
IGRldmljZSB0aGF0IHNlbmRzIG1vcmUgYnl0ZXMgdGhhbiB0aGUgd2luZG93IG92ZXJydW5zIHNs
b3QtPmRhdGEKPiBpbnRvIHRoZSBwb29sLgoKSXQgaXMgaW5kZWVkIHBvc3NpYmxlLiBQbGVhc2Ug
c2VuZCBhIHBhdGNoIQoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlz
dApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
