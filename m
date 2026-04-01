Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A61D35160
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Apr 2026 09:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tU+UYryRDWnYTF/LCG3BYfdW1jcovgtV7K54kw/7Ceo=; b=YqRi/uf2zFOXPk
	/rS+4Rqyn7tvJo1ojSF/FJq8r1i/4sV2X+trV4ZOMpO4M9N+/CkM0I+ZOc1E6Ik9qiP3QBzQXWFmu
	LXtesMyEx2AFO29EU5MYZe/oswGZIgSykSOg1EhuS5jbWfB/7nH1T6Y0HCtG8zLlIFCuJFkX1d99x
	VqVvHnD1C5aZ4NFxXPsF+LRr5JLbW8Hk2pe+xDt1Sk8SVGQAVzW/eit7lrpsBW63P1aR0/5W6V2Kq
	Zv1C7mRowd5GVLFo6XYAHEO191vgZsPlL1B74AuqM5StjQ+TqAd1VlB+GyJDp346J7N1aqwdiYYAL
	Ubk7wrAhxnkYcOguyI2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7rek-0000000EN2f-16rU;
	Wed, 01 Apr 2026 09:14:34 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7reh-0000000EN1u-2OiM
	for linux-i3c@lists.infradead.org;
	Wed, 01 Apr 2026 09:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1775034863;
	bh=GuqSIVNsuPKeKiOtrThRYOe5+o6JcSmMgNIoqUElxqo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Iler7UFT8F7J5wiTy6etV2KZh38RY/JUUq+sOpSM4/mCuGpc1DHW5HOrODwaw2kd1
	 9/H2/hYVJ7/nNERA4kHb7pxGN8XNdTzCUNyTRMIOwdAM4/s92XkiHZi3U7VA4yFLQm
	 XBYzaQqOPU5/vHpny8VzQhj9ck3yU4QhzTgzPqzDF8LRnmqQmP2+E7Fgl2H0ehfMrQ
	 gzUm5CxbHYadRmUwDon1zajvA2pXsBOtRmIBo+wi+WTyyeK970g+fwaTsgcBojPNG5
	 I4Q8peiOoGJrkn+X53fcyD8YzBtLInHinYRfeZX+chZVM0wWVKy+JukcPNtFEjyMhn
	 hKIa4ycX+pPFQ==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7B8316506C;
	Wed,  1 Apr 2026 17:14:22 +0800 (AWST)
Message-ID: <a9b3a99f42bb9d092e95b35290cf4043fc780d3f.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] i3c: dw-i3c-master: Fix IBI count register selection
 for versalnet
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	linux-kernel@vger.kernel.org
Cc: git@amd.com, Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	 <Frank.Li@nxp.com>, Joel Stanley <joel@jms.id.au>, 
	linux-i3c@lists.infradead.org
Date: Wed, 01 Apr 2026 17:14:22 +0800
In-Reply-To: <20260401084430.436059-1-shubhrajyoti.datta@amd.com>
References: <20260401084430.436059-1-shubhrajyoti.datta@amd.com>
User-Agent: Evolution 3.46.4-2+deb12u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_021431_831510_2324137D 
X-CRM114-Status: GOOD (  11.30  )
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

SGkgU2h1YmhyYWp5b3RpLAoKPiBPbiBEZXNpZ25XYXJlIEkzQyBjb250cm9sbGVycyB3aGVyZSBJ
Q19IQVNfSUJJX0RBVEE9MCAoc3VjaCBhcyB2ZXJzYWxuZXQpLAo+IHRoZSBJQklfU1RTX0NOVCBm
aWVsZCAoYml0cyBbMjg6MjRdIG9mIFFVRVVFX1NUQVRVU19MRVZFTCkgaXMgaGFyZHdpcmVkCj4g
dG8gMC4gVGhlIElCSSBzdGF0dXMgZW50cnkgY291bnQgaXMgaW5zdGVhZCByZXBvcnRlZCB2aWEg
SUJJX0JVRl9CTFIKPiAoYml0cyBbMjM6MTZdIG9mIHRoZSBzYW1lIHJlZ2lzdGVyKS4KPiAKPiBp
cnFfaGFuZGxlX2liaXMoKSB3YXMgdW5jb25kaXRpb25hbGx5IHJlYWRpbmcgSUJJX1NUU19DTlQs
IGNhdXNpbmcgaXQgdG8KPiBhbHdheXMgc2VlIDAgcGVuZGluZyBJQklzIG9uIHZlcnNhbG5ldCBh
bmQgcmV0dXJuIGVhcmx5IHdpdGhvdXQgZHJhaW5pbmcKPiB0aGUgSUJJIGJ1ZmZlci4gU2luY2Ug
SU5UUl9JQklfVEhMRF9TVEFUIGlzIGxldmVsLXRyaWdnZXJlZCBhZ2FpbnN0IHRoZQo+IGJ1ZmZl
ciBmaWxsIGxldmVsLCB0aGlzIGxlZnQgdGhlIGludGVycnVwdCBwZXJtYW5lbnRseSBhc3NlcnRl
ZC4KPiAKPiBEZXRlY3QgSUJJIGRhdGEgY2FwYWJpbGl0eSBhdCBwcm9iZSB0aW1lIGJ5IHdyaXRp
bmcgdGhlIElCSSBkYXRhIHRocmVzaG9sZAo+IGZpZWxkIGluIFFVRVVFX1RITERfQ1RSTCBhbmQg
cmVhZGluZyBpdCBiYWNrLiBVc2UgdGhlIHJlc3VsdCB0byBzZWxlY3QgdGhlCj4gY29ycmVjdCBy
ZWdpc3RlciBmaWVsZCBpbiBpcnFfaGFuZGxlX2liaXMoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBT
aHViaHJhanlvdGkgRGF0dGEgPHNodWJocmFqeW90aS5kYXR0YUBhbWQuY29tPgo+IC0tLQo+IAo+
IENoYW5nZXMgaW4gdjI6Cj4gUmVtb3ZlIHRoZSBmaXhlcyB0YWcKClRoZSBiYXNlIGNvbnRleHQg
bG9va3MgYmV0dGVyIG5vdywgdGhhbmtzLgoKT25lIG90aGVyIHF1ZXN0aW9uIHRob3VnaDoKCj4g
K8KgwqDCoMKgwqDCoMKgLyoKPiArwqDCoMKgwqDCoMKgwqAgKiBEZXRlY3QgSUJJIGRhdGEgY2Fw
YWJpbGl0eSAoSUNfSEFTX0lCSV9EQVRBKTogd3JpdGUgYSBub24temVybyB2YWx1ZQo+ICvCoMKg
wqDCoMKgwqDCoCAqIHRvIElCSV9EQVRBX1RITEQgYW5kIHJlYWQgYmFjay4gT24gY29udHJvbGxl
cnMgbGlrZSBWZXJzYWxuZXQKPiArwqDCoMKgwqDCoMKgwqAgKiB0aGUgZmllbGQgaXMgaGFyZHdp
cmVkIHRvIDAgYW5kIHRoZSB3cml0ZSBpcyBpZ25vcmVkLiBSZXN0b3JlIHRoZQo+ICvCoMKgwqDC
oMKgwqDCoCAqIG9yaWdpbmFsIHJlZ2lzdGVyIHZhbHVlIGFmdGVyIGRldGVjdGlvbi4KPiArwqDC
oMKgwqDCoMKgwqAgKi8KPiArwqDCoMKgwqDCoMKgwqB0aGxkX2N0cmwgPSByZWFkbChtYXN0ZXIt
PnJlZ3MgKyBRVUVVRV9USExEX0NUUkwpOwo+ICvCoMKgwqDCoMKgwqDCoHJldCA9IHRobGRfY3Ry
bCB8IFFVRVVFX1RITERfQ1RSTF9JQklfREFUQSgyKTsKPiArwqDCoMKgwqDCoMKgwqB3cml0ZWwo
cmV0LCBtYXN0ZXItPnJlZ3MgKyBRVUVVRV9USExEX0NUUkwpOwo+ICvCoMKgwqDCoMKgwqDCoHJl
dCA9IHJlYWRsKG1hc3Rlci0+cmVncyArIFFVRVVFX1RITERfQ1RSTCk7Cj4gK8KgwqDCoMKgwqDC
oMKgaWYgKHJldCAmIFFVRVVFX1RITERfQ1RSTF9JQklfREFUQV9NQVNLKQo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBtYXN0ZXItPmhhc19pYmlfZGF0YSA9IHRydWU7Cj4gK8KgwqDC
oMKgwqDCoMKgd3JpdGVsKHRobGRfY3RybCwgbWFzdGVyLT5yZWdzICsgUVVFVUVfVEhMRF9DVFJM
KTsKCkhvdyBhcmUgeW91IGJpbmRpbmcgdGhlIGRyaXZlciB0byB0aGlzIGRldmljZT8gQXJlIHlv
dSB1c2luZyBhIHVuaXF1ZQpPRiBjb21wYXRpYmxlIHN0cmluZywgb3Igc29tZXRoaW5nIEFDUEkt
YmFzZWQ/CgouLi4gYW5kIGlmIHRoYXQgY2FuIGJlIHNwZWNpZmljIHRvIHRoaXMgaGFyZHdhcmUg
aW5zdGFuY2UsIHdvdWxkIHRoYXQgYmUKYW4gZWZmZWN0aXZlIG1lY2hhbmlzbSB0byBzZWxlY3Qg
dGhlIElCSSByZWFkIG1ldGhvZCBpbnN0ZWFkPwoKQ2hlZXJzLAoKCkplcmVteQoKLS0gCmxpbnV4
LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
