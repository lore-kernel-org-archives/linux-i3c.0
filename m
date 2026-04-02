Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34803CC6B33
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Apr 2026 08:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ClnPHwlJGu/nvJJE/0uDQUwWnyr1OuuuicAQg8vxtk=; b=OY+UloyvKQIXOE
	sACkddMCbo/+zUnG0aHdJmU0Dh0JWOAbo96f6v007s0R7HOJ6tlujrxkwFSBGMzsSWuQglYrUNUDx
	OMxYztHJY38fvPe19jm6E38oxBOjeMSpRB4gGHQxN5N42BAYqB9afTaTAbhiaNcxuW9LH5fO9Tvbi
	5aMeKhi9BUmo/SsxHIiBUzqWLWUmd4NJ2sOzaYcP4HB1pIW2/DWsz8+Rfte07gv8/lNn1KpxnwBvG
	qo9TAvLCZy0J8GIe8sw2gmRHLw/jUuSrRuLIHgbT/xKyMmI7iWxesjLfaP+52/M8FZmitCjZDmIX0
	dhxWpfwOuNyXjeO4Z6Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8DTl-0000000HBQE-3VZA;
	Thu, 02 Apr 2026 08:32:41 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8DTi-0000000HBPe-1gpE
	for linux-i3c@lists.infradead.org;
	Thu, 02 Apr 2026 08:32:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1775118751;
	bh=eZcJ64gmgk3xVHXG1yPukJP/maK5TiEMdaQBHSRLdPg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ATSN0PDTv9ZBpdlAM3GrYne8MKAshSP2c0FBPaxXUN3qOaE6WwBi7yxDy533b6nfn
	 DnBTW9PBBxc/k9GQTmCMgRq+DSbs/aHLv67oRGaNiW6PfPbXFDnAz3Uk2wg0vieXIn
	 PC8nPnZYNaFfb3nLGte8cyxM7S6YKzri9ZzTKKiTsQjfI3Z4ctFfqckUQm68rdytIE
	 bTOp7FHr5uEoZERJ0D/QhcHRmH5Q9gxQy8e/3v17oXmUDG7hm4TiTkHpGWFaK12cgA
	 aXCmrpfj/k6oEBnUszTDdE/Ggvxi27bsOXzGGl1ZDp8mJ54G2drjP7TJFR1tqn6IMY
	 rWMdq+FUaUyBA==
Received: from [192.168.72.167] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8A53365082;
	Thu,  2 Apr 2026 16:32:30 +0800 (AWST)
Message-ID: <5cb83afcd5340a108fd5a7346494ccf73752cc27.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] i3c: dw-i3c-master: Fix IBI count register selection
 for versalnet
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>, 
	"linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Cc: "git (AMD-Xilinx)" <git@amd.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Joel Stanley
	 <joel@jms.id.au>, "linux-i3c@lists.infradead.org"
	 <linux-i3c@lists.infradead.org>
Date: Thu, 02 Apr 2026 16:32:30 +0800
In-Reply-To: <LV5PR12MB9828D700D168803CBD022A708151A@LV5PR12MB9828.namprd12.prod.outlook.com>
References: <20260401084430.436059-1-shubhrajyoti.datta@amd.com>
	 <a9b3a99f42bb9d092e95b35290cf4043fc780d3f.camel@codeconstruct.com.au>
	 <LV5PR12MB9828D700D168803CBD022A708151A@LV5PR12MB9828.namprd12.prod.outlook.com>
User-Agent: Evolution 3.46.4-2+deb12u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_013238_674674_25BEEB90 
X-CRM114-Status: GOOD (  17.37  )
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

SGkgU2h1YmhyYWp5b3RpLAoKPiA+IEhvdyBhcmUgeW91IGJpbmRpbmcgdGhlIGRyaXZlciB0byB0
aGlzIGRldmljZT8gQXJlIHlvdSB1c2luZyBhIHVuaXF1ZSBPRgo+ID4gY29tcGF0aWJsZSBzdHJp
bmcsIG9yIHNvbWV0aGluZyBBQ1BJLWJhc2VkPwo+ID4gCj4gPiAuLi4gYW5kIGlmIHRoYXQgY2Fu
IGJlIHNwZWNpZmljIHRvIHRoaXMgaGFyZHdhcmUgaW5zdGFuY2UsIHdvdWxkIHRoYXQgYmUgYW4K
PiA+IGVmZmVjdGl2ZSBtZWNoYW5pc20gdG8gc2VsZWN0IHRoZSBJQkkgcmVhZCBtZXRob2QgaW5z
dGVhZD8KPiBIaSBKZXJlbXksCj4gCj4gVmVyc2FsTmV0IGN1cnJlbnRseSB1c2VzIHRoZSBnZW5l
cmljICJzbnBzLGR3LWkzYy1tYXN0ZXItMS4wMGEiCj4gY29tcGF0aWJsZSBzdHJpbmcg4oCUIHRo
ZXJlIGlzIG5vIHVuaXF1ZSBjb21wYXRpYmxlIHN0cmluZyBmb3IgdGhpcwo+IGhhcmR3YXJlIGlu
c3RhbmNlLiBUaGUgRFRTIMKgwqAgZW50cnkgbG9va3MgbGlrZToKPiAKPiDCoCBjb21wYXRpYmxl
ID0gInNucHMsZHctaTNjLW1hc3Rlci0xLjAwYSI7CgpZb3Ugc2hvdWxkICphbHdheXMqIGhhdmUg
YSB1bmlxdWUgY29tcGF0aWJsZSBzdHJpbmcgZm9yIGVhY2ggZGV2aWNlCmluc3RhbmNlLCBpZiB0
aGVyZSBjYW4gYmUgYW55IHZhcmlhdGlvbiBpbiBiZWhhdmlvdXJzIGZyb20gdGhhdCBnZW5lcmlj
Cm9uZSAod2hpY2ggeW91IGNlcnRhaW5seSBkbyBoYXZlIGhlcmUpLgoKWW91IGNhbiBzdGlsbCBm
YWxsLWJhY2sgb24gYSBnZW5lcmljIG9uZSwgYnV0IHVzaW5nIHRoYXQgYXMgeW91ciBvbmx5CmNv
bXBhdGlibGUgdmFsdWUgbWVhbnMgeW91IGNhbid0IGRvIGRldmljZS1zcGVjaWZpYyBiZWhhdmlv
dXJzIGluIHlvdXIKZHJpdmVyLCBhcyB5b3UgaGF2ZSBqdXN0IGZvdW5kLgoKPiDCoCBXZSBjb3Vs
ZCBpbnRyb2R1Y2UgYSBWZXJzYWxOZXQtc3BlY2lmaWMgY29tcGF0aWJsZSB3aXRoIGEgZ2VuZXJp
YyBmYWxsYmFjazoKPiAKPiDCoCBjb21wYXRpYmxlID0gInhsbngsdmVyc2FsbmV0LWR3LWkzYy1t
YXN0ZXIiLCAic25wcyxkdy1pM2MtbWFzdGVyLTEuMDBhIjsKClllcywgeW91IHdhbnQgdGhhdCBh
bnl3YXkuCgo+IMKgIGFuZCBwYXNzIGEgcXVpcmsgZmxhZyB2aWEgb2ZfZGV2aWNlX2lkLmRhdGEg
dG8gc2VsZWN0IHRoZSBJQkkgcmVhZCBtZXRob2QuCgpFeGFjdGx5LCBhbmQgdGhlcmUgaXMgYWxy
ZWFkeSB0aGUgc3RydWN0IGR3X2kzY19kcnZkYXRhIHRvIGhlbHAgd2l0aAp0aGlzLgoKPiBIb3dl
dmVyLCB0aGUgcHJvYmUtdGltZSBkZXRlY3Rpb24gYXZvaWRzIGhhdmluZyB0byBlbnVtZXJhdGUg
YWxsIGFmZmVjdGVkCj4gdmFyaWFudHMg4oCUIHRoZSBJQ19IQVNfSUJJX0RBVEE9MCBjb25maWd1
cmF0aW9uIGlzIGEgc3ludGhlc2l6YWJsZQo+IG9wdGlvbiBpbiB0aGUgSVAgYW5kIG1heSBhcHBl
YXIgaW4gb3RoZXIgU29DcyB1c2luZyB0aGUgc2FtZSBjb3JlLgo+IAo+IERvIHlvdSBoYXZlIGEg
cHJlZmVyZW5jZT8gSWYgdGhlIERUUyBjaGFuZ2UgaXMgYWNjZXB0YWJsZSwgSSBjYW4gZ28KPiB3
aXRoIHRoZSBjb21wYXRpYmxlICsgbWF0Y2gtZGF0YSBhcHByb2FjaAoKVGhhdCB3b3VsZCBjZXJ0
YWlubHkgYmUgbXkgcmVjb21tZW5kYXRpb24uCgpJZiBpdCdzIGEgc3ludGhlc2lzYWJsZSBvcHRp
b24sIGl0IG1heSBldmVuIGJlIHdvcnRoIGFkZGluZyBhcyBhIGZsYWcgdG8KdGhlIGJpbmRpbmcg
ZGVmaW5pdGlvbiAoYWxvbmcgd2l0aCB0aGUgc2FtZSBmb3Igb3RoZXIgb3B0aW9ucyB0aGF0IG1p
Z2h0CmJlIHByZXNlbnQpLiBUaGlzIHdvdWxkIG1lYW4geW91IGRvbid0IG5lZWQgYS1wcmlvcmkg
a25vd2xlZGdlIG9mIHRoZQptYXBwaW5nIG9mIGNvbXBhdGlibGUgc3RyaW5ncyB0byB0aGVpciBz
eW50aGVzaXMgb3B0aW9ucy4KCkkgZG9uJ3QgaGF2ZSBhbnkgYWNjZXNzIHRvIGRvY3VtZW50YXRp
b24gb24gdGhvc2Ugb3B0aW9ucyB0aG91Z2gsIHNvCmNhbid0IGJlIG9mIG11Y2ggaGVscCB3aXRo
IGRvaW5nIHRoYXQuCgo+IEhvd2V2ZXIgSSB0aG91Z2h0IHRoYXQgZGV0ZWN0aW5nIGl0IHdpbGwg
YmUgaGVscGZ1bCBmb3IgYmFja3dhcmQgY29tcGF0aWJsZS4KCkdpdmVuIGl0IGRvZXNuJ3Qgd29y
ayBhdCB0aGUgbW9tZW50LCB0aGVyZSBzaG91bGRuJ3QgYmUgYW55IGJhY2t3YXJkcwpjb21wYXQg
Y29uY2VybnMsIEkgdGhpbms/CgpDaGVlcnMsCgoKSmVyZW15CgotLSAKbGludXgtaTNjIG1haWxp
bmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
