Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A31E85379
	for <linux-i3c@archiver.kernel.org>; Fri,  3 Apr 2026 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HxIsrsNMxgy6WtnwwjG0ghoQl616SR0ez+RFPBR1h3E=; b=LolGzMH/dBQwmE
	D7cynTU7zk3GNuw1HhCWcJt3PtrtELEgkgJDLJNIOSqVZWJwQTUZhqPIo3BwIA9p5+EeFcGw0xW5D
	TjkX+CYcx+tRoQWGRE9qIWM552FLvPiX8bjlc8xMt7yANX86fZtRMfVyrcjwo50c/REUyadF3Tn8H
	O3HltzPO8UXTqmjep3xcPYUTWwO6i4R/fkvTm2PvwM56wG9iwXYYw7QZpTESTRXTz/hfjr0RjbsZ4
	/rMNSpxRgB1JpcgRTgQvbcWbubORGa3jWTHzrzA07k2XkE7E4qLrynX0WfjibJeuUhgNlvnWV35Fd
	7A7y82CUAiMBeT5KaB7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hKF-00000002JuW-3RYB;
	Fri, 03 Apr 2026 16:24:51 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hKC-00000002Jti-2olp
	for linux-i3c@lists.infradead.org;
	Fri, 03 Apr 2026 16:24:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E519AC59F5E;
	Fri,  3 Apr 2026 16:25:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D7A90603C1;
	Fri,  3 Apr 2026 16:24:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CFDB5104500FB;
	Fri,  3 Apr 2026 18:24:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775233485; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=53h5lBCesrRbN58GkWw0dPf7qTDPSdaW29s2knM9AY8=;
	b=jxUjCiEkIBuUy7VstcorIWgzSFDtFWxoH6PKRen+aJKF8kONNxoKnOuXbIzj0vEPrp+H1N
	d0CFHUknyrRZTl2DSNDyi2IEJD5uZP3fWARsFzwzZnCNQw0mhwhI2xZO9qumfDujTKxKX8
	4HbraXWSO7D2GpZgBnXMUR1o3oFtdwGFVuBqXVvUl7lVbsT6rJasQhwi/Q0cBeIb25bnDp
	h6/YB3wp0gd/pvm3bR7+tjoWxneWJNAK7QM5j3osKTCXprhiv+CYRzAGgmy7z9wYCXLKQ4
	DKgYd6ftC0+csFs2HCBqyittjHnXFkT2Ygd7mXI/jGNvDtz70zMc9anaJocfjw==
Date: Fri, 3 Apr 2026 18:24:42 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"git (AMD-Xilinx)" <git@amd.com>, Frank Li <Frank.Li@nxp.com>,
	Joel Stanley <joel@jms.id.au>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Subject: Re: [PATCH v2] i3c: dw-i3c-master: Fix IBI count register selection
 for versalnet
Message-ID: <20260403162442668f12b7@mail.local>
References: <20260401084430.436059-1-shubhrajyoti.datta@amd.com>
 <a9b3a99f42bb9d092e95b35290cf4043fc780d3f.camel@codeconstruct.com.au>
 <LV5PR12MB9828D700D168803CBD022A708151A@LV5PR12MB9828.namprd12.prod.outlook.com>
 <5cb83afcd5340a108fd5a7346494ccf73752cc27.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5cb83afcd5340a108fd5a7346494ccf73752cc27.camel@codeconstruct.com.au>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_092448_889467_598ED478 
X-CRM114-Status: GOOD (  28.54  )
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

SGVsbG8sCgpPbiAwMi8wNC8yMDI2IDE2OjMyOjMwKzA4MDAsIEplcmVteSBLZXJyIHdyb3RlOgo+
IEhpIFNodWJocmFqeW90aSwKPiAKPiA+ID4gSG93IGFyZSB5b3UgYmluZGluZyB0aGUgZHJpdmVy
IHRvIHRoaXMgZGV2aWNlPyBBcmUgeW91IHVzaW5nIGEgdW5pcXVlIE9GCj4gPiA+IGNvbXBhdGli
bGUgc3RyaW5nLCBvciBzb21ldGhpbmcgQUNQSS1iYXNlZD8KPiA+ID4gCj4gPiA+IC4uLiBhbmQg
aWYgdGhhdCBjYW4gYmUgc3BlY2lmaWMgdG8gdGhpcyBoYXJkd2FyZSBpbnN0YW5jZSwgd291bGQg
dGhhdCBiZSBhbgo+ID4gPiBlZmZlY3RpdmUgbWVjaGFuaXNtIHRvIHNlbGVjdCB0aGUgSUJJIHJl
YWQgbWV0aG9kIGluc3RlYWQ/Cj4gPiBIaSBKZXJlbXksCj4gPiAKPiA+IFZlcnNhbE5ldCBjdXJy
ZW50bHkgdXNlcyB0aGUgZ2VuZXJpYyAic25wcyxkdy1pM2MtbWFzdGVyLTEuMDBhIgo+ID4gY29t
cGF0aWJsZSBzdHJpbmcg4oCUIHRoZXJlIGlzIG5vIHVuaXF1ZSBjb21wYXRpYmxlIHN0cmluZyBm
b3IgdGhpcwo+ID4gaGFyZHdhcmUgaW5zdGFuY2UuIFRoZSBEVFMgwqDCoCBlbnRyeSBsb29rcyBs
aWtlOgo+ID4gCj4gPiDCoCBjb21wYXRpYmxlID0gInNucHMsZHctaTNjLW1hc3Rlci0xLjAwYSI7
Cj4gCj4gWW91IHNob3VsZCAqYWx3YXlzKiBoYXZlIGEgdW5pcXVlIGNvbXBhdGlibGUgc3RyaW5n
IGZvciBlYWNoIGRldmljZQo+IGluc3RhbmNlLCBpZiB0aGVyZSBjYW4gYmUgYW55IHZhcmlhdGlv
biBpbiBiZWhhdmlvdXJzIGZyb20gdGhhdCBnZW5lcmljCj4gb25lICh3aGljaCB5b3UgY2VydGFp
bmx5IGRvIGhhdmUgaGVyZSkuCj4gCj4gWW91IGNhbiBzdGlsbCBmYWxsLWJhY2sgb24gYSBnZW5l
cmljIG9uZSwgYnV0IHVzaW5nIHRoYXQgYXMgeW91ciBvbmx5Cj4gY29tcGF0aWJsZSB2YWx1ZSBt
ZWFucyB5b3UgY2FuJ3QgZG8gZGV2aWNlLXNwZWNpZmljIGJlaGF2aW91cnMgaW4geW91cgo+IGRy
aXZlciwgYXMgeW91IGhhdmUganVzdCBmb3VuZC4KPiAKPiA+IMKgIFdlIGNvdWxkIGludHJvZHVj
ZSBhIFZlcnNhbE5ldC1zcGVjaWZpYyBjb21wYXRpYmxlIHdpdGggYSBnZW5lcmljIGZhbGxiYWNr
Ogo+ID4gCj4gPiDCoCBjb21wYXRpYmxlID0gInhsbngsdmVyc2FsbmV0LWR3LWkzYy1tYXN0ZXIi
LCAic25wcyxkdy1pM2MtbWFzdGVyLTEuMDBhIjsKPiAKPiBZZXMsIHlvdSB3YW50IHRoYXQgYW55
d2F5Lgo+IAoKSSBhZ3JlZSB5b3UgbmVlZCBhIFZlcnNhbE5ldC1zcGVjaWZpYyBjb21wYXRpYmxl
IHN0cmluZy4KCj4gPiDCoCBhbmQgcGFzcyBhIHF1aXJrIGZsYWcgdmlhIG9mX2RldmljZV9pZC5k
YXRhIHRvIHNlbGVjdCB0aGUgSUJJIHJlYWQgbWV0aG9kLgo+IAo+IEV4YWN0bHksIGFuZCB0aGVy
ZSBpcyBhbHJlYWR5IHRoZSBzdHJ1Y3QgZHdfaTNjX2RydmRhdGEgdG8gaGVscCB3aXRoCj4gdGhp
cy4KPiAKPiA+IEhvd2V2ZXIsIHRoZSBwcm9iZS10aW1lIGRldGVjdGlvbiBhdm9pZHMgaGF2aW5n
IHRvIGVudW1lcmF0ZSBhbGwgYWZmZWN0ZWQKPiA+IHZhcmlhbnRzIOKAlCB0aGUgSUNfSEFTX0lC
SV9EQVRBPTAgY29uZmlndXJhdGlvbiBpcyBhIHN5bnRoZXNpemFibGUKPiA+IG9wdGlvbiBpbiB0
aGUgSVAgYW5kIG1heSBhcHBlYXIgaW4gb3RoZXIgU29DcyB1c2luZyB0aGUgc2FtZSBjb3JlLgo+
ID4gCj4gPiBEbyB5b3UgaGF2ZSBhIHByZWZlcmVuY2U/IElmIHRoZSBEVFMgY2hhbmdlIGlzIGFj
Y2VwdGFibGUsIEkgY2FuIGdvCj4gPiB3aXRoIHRoZSBjb21wYXRpYmxlICsgbWF0Y2gtZGF0YSBh
cHByb2FjaAo+IAo+IFRoYXQgd291bGQgY2VydGFpbmx5IGJlIG15IHJlY29tbWVuZGF0aW9uLgo+
IAo+IElmIGl0J3MgYSBzeW50aGVzaXNhYmxlIG9wdGlvbiwgaXQgbWF5IGV2ZW4gYmUgd29ydGgg
YWRkaW5nIGFzIGEgZmxhZyB0bwo+IHRoZSBiaW5kaW5nIGRlZmluaXRpb24gKGFsb25nIHdpdGgg
dGhlIHNhbWUgZm9yIG90aGVyIG9wdGlvbnMgdGhhdCBtaWdodAo+IGJlIHByZXNlbnQpLiBUaGlz
IHdvdWxkIG1lYW4geW91IGRvbid0IG5lZWQgYS1wcmlvcmkga25vd2xlZGdlIG9mIHRoZQo+IG1h
cHBpbmcgb2YgY29tcGF0aWJsZSBzdHJpbmdzIHRvIHRoZWlyIHN5bnRoZXNpcyBvcHRpb25zLgo+
IAo+IEkgZG9uJ3QgaGF2ZSBhbnkgYWNjZXNzIHRvIGRvY3VtZW50YXRpb24gb24gdGhvc2Ugb3B0
aW9ucyB0aG91Z2gsIHNvCj4gY2FuJ3QgYmUgb2YgbXVjaCBoZWxwIHdpdGggZG9pbmcgdGhhdC4K
PiAKPiA+IEhvd2V2ZXIgSSB0aG91Z2h0IHRoYXQgZGV0ZWN0aW5nIGl0IHdpbGwgYmUgaGVscGZ1
bCBmb3IgYmFja3dhcmQgY29tcGF0aWJsZS4KPiAKPiBHaXZlbiBpdCBkb2Vzbid0IHdvcmsgYXQg
dGhlIG1vbWVudCwgdGhlcmUgc2hvdWxkbid0IGJlIGFueSBiYWNrd2FyZHMKPiBjb21wYXQgY29u
Y2VybnMsIEkgdGhpbms/CgpJIGd1ZXNzIHRoZSBwcm9wb3NlZCBzb2x1dGlvbiB3b3JrcyBhcyB3
ZSBjYW4gcHJvYmUgdGhlIEhXIHRvIGtub3cgaG93Cml0IHdhcyBzeW50aGVzaXNlZC4gSXQncyBn
b29kIHRvIGJlIGFibGUgdG8gYXZvaWQgaGF2aW5nIGRldmljZSB0cmVlCnByb3BlcnRpZXMgZm9y
IHRoaW5ncyB3ZSBjYW4gZGlzY292ZXIuCgoKLS0gCkFsZXhhbmRyZSBCZWxsb25pLCBjby1vd25l
ciBhbmQgQ09PLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcK
aHR0cHM6Ly9ib290bGluLmNvbQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1pM2MK
