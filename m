Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A706CCA0EC3
	for <linux-i3c@archiver.kernel.org>; Tue, 12 Sep 2023 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/rid+/Y84qFZm04Ah/ZX2gPEPki8Jp+JjUh2NxCv7uE=; b=sFLI+1kcRYdz3q
	3aWIaqg9R1ScjPDNYWD2QunsjqDH8cH7MPvjMec5Ds3ZozPXZA9ZaLtgT5jW7aKBQOiixFYA6ErcN
	ylD5fB5ELMw4EwmTOEF/vTlV2drnUucIceQN0GTwHF8dHXfvdEL9N/4snoDOamezCeD4wGRuipfcH
	cdGB4l0OshLiDEqZFPIjsLhLHy57JJutaNCYRRjtxQxyeG+1DiL7kbgixcd+CIyS/uaew+EXJUUUN
	35ZZkfK7yYvGT0jksiaapxA3sRhJjrOaqFfpiSLCGh/fan4dZzsjma1Pa2fFfCclfWvQhur+oV9LA
	0pcxkklzlQuMoCV+sGkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg14w-00332z-30;
	Tue, 12 Sep 2023 10:57:10 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg14u-0032zu-0x
	for linux-i3c@lists.infradead.org;
	Tue, 12 Sep 2023 10:57:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72726E0006;
	Tue, 12 Sep 2023 10:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694516226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J61rx//PPkUlb2Sgp0SYcJ40b+/rbdWLC/XlBtvN7xM=;
	b=ceinYO6zdv69WaKDudQCC+YKCOL1pbZ+SEvMhXRIMP+brevSJd5G0Oym2crb4KNKmslDO4
	prNgoqb6XpruzCwM08cgaJsj5SfC+pqmFIikAQj/95ey6J77w+A5WbPMYrETwTCDneAfM3
	gIbjk3A75SGab0xAcvetrPvV6wyBZ3VxRKsHLH4dQ2pLoMHNquEAcp7hEr/Rd3ORav98Pl
	5RePwvnK03ODoZTgg3jnN1X2ACe0U/ms+pgQyr9uWS1NvZFt8E7IEcQ40OHQ0oCLFarUv3
	20MgV3vpdS3bZ5K5nXysgSW9JTtnhEHiSva+lLVCqBD9nWHgv3N39TjgEQFwqA==
Date: Tue, 12 Sep 2023 12:57:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: <pgaj@cadence.com>, <alexandre.belloni@bootlin.com>,
 <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] i3c: master: cdns: Fix reading status register
Message-ID: <20230912125704.5fb1a102@xps-13>
In-Reply-To: <20230911081623.21963-2-joshua.yeong@starfivetech.com>
References: <20230911081623.21963-1-joshua.yeong@starfivetech.com>
	<20230911081623.21963-2-joshua.yeong@starfivetech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_035708_484332_59445470 
X-CRM114-Status: GOOD (  13.54  )
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

SGkgSm9zaHVhLAoKam9zaHVhLnllb25nQHN0YXJmaXZldGVjaC5jb20gd3JvdGUgb24gTW9uLCAx
MSBTZXAgMjAyMyAxNjoxNjoyNCArMDgwMDoKCj4gSUJJUl9ERVBUSCBhbmQgQ01EUl9ERVBUSCBz
aG91bGQgcmVhZCBmcm9tIHN0YXR1czAgaW5zdGVhZCBvZiBzdGF0dXMxCgoJCQkJICBiZQoKTWlz
c2luZyAnLicgYXQgdGhlIGVuZC4KCk1pc3NpbmcgRml4ZXM6IHRhZyBhcyB3ZWxsIGFzIENjOiBz
dGFibGUuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvc2h1YSBZZW9uZyA8am9zaHVhLnllb25nQHN0
YXJmaXZldGVjaC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvaTNjL21hc3Rlci9pM2MtbWFzdGVyLWNk
bnMuYyB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9pM2MtbWFzdGVy
LWNkbnMuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9pM2MtbWFzdGVyLWNkbnMuYwo+IGluZGV4IDQ5
NTUxZGI3MWJjOS4uOGYxZmRhM2M3YWM1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rl
ci9pM2MtbWFzdGVyLWNkbnMuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9pM2MtbWFzdGVy
LWNkbnMuYwo+IEBAIC0xOTEsNyArMTkxLDcgQEAKPiAgI2RlZmluZSBTTFZfU1RBVFVTMV9ISl9E
SVMJCUJJVCgxOCkKPiAgI2RlZmluZSBTTFZfU1RBVFVTMV9NUl9ESVMJCUJJVCgxNykKPiAgI2Rl
ZmluZSBTTFZfU1RBVFVTMV9QUk9UX0VSUgkJQklUKDE2KQo+IC0jZGVmaW5lIFNMVl9TVEFUVVMx
X0RBKHgpCQkoKChzKSAmIEdFTk1BU0soMTUsIDkpKSA+PiA5KQo+ICsjZGVmaW5lIFNMVl9TVEFU
VVMxX0RBKHMpCQkoKChzKSAmIEdFTk1BU0soMTUsIDkpKSA+PiA5KQo+ICAjZGVmaW5lIFNMVl9T
VEFUVVMxX0hBU19EQQkJQklUKDgpCj4gICNkZWZpbmUgU0xWX1NUQVRVUzFfRERSX1JYX0ZVTEwJ
CUJJVCg3KQo+ICAjZGVmaW5lIFNMVl9TVEFUVVMxX0REUl9UWF9GVUxMCQlCSVQoNikKPiBAQCAt
MTYyMywxMyArMTYyMywxMyBAQCBzdGF0aWMgaW50IGNkbnNfaTNjX21hc3Rlcl9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJLyogRGV2aWNlIElEMCBpcyByZXNlcnZlZCB0
byBkZXNjcmliZSB0aGlzIG1hc3Rlci4gKi8KPiAgCW1hc3Rlci0+bWF4ZGV2cyA9IENPTkZfU1RB
VFVTMF9ERVZTX05VTSh2YWwpOwo+ICAJbWFzdGVyLT5mcmVlX3JyX3Nsb3RzID0gR0VOTUFTSyht
YXN0ZXItPm1heGRldnMsIDEpOwo+ICsJbWFzdGVyLT5jYXBzLmliaXJmaWZvZGVwdGggPSBDT05G
X1NUQVRVUzBfSUJJUl9ERVBUSCh2YWwpOwo+ICsJbWFzdGVyLT5jYXBzLmNtZHJmaWZvZGVwdGgg
PSBDT05GX1NUQVRVUzBfQ01EUl9ERVBUSCh2YWwpOwo+ICAKPiAgCXZhbCA9IHJlYWRsKG1hc3Rl
ci0+cmVncyArIENPTkZfU1RBVFVTMSk7Cj4gIAltYXN0ZXItPmNhcHMuY21kZmlmb2RlcHRoID0g
Q09ORl9TVEFUVVMxX0NNRF9ERVBUSCh2YWwpOwo+ICAJbWFzdGVyLT5jYXBzLnJ4Zmlmb2RlcHRo
ID0gQ09ORl9TVEFUVVMxX1JYX0RFUFRIKHZhbCk7Cj4gIAltYXN0ZXItPmNhcHMudHhmaWZvZGVw
dGggPSBDT05GX1NUQVRVUzFfVFhfREVQVEgodmFsKTsKPiAtCW1hc3Rlci0+Y2Fwcy5pYmlyZmlm
b2RlcHRoID0gQ09ORl9TVEFUVVMwX0lCSVJfREVQVEgodmFsKTsKPiAtCW1hc3Rlci0+Y2Fwcy5j
bWRyZmlmb2RlcHRoID0gQ09ORl9TVEFUVVMwX0NNRFJfREVQVEgodmFsKTsKPiAgCj4gIAlzcGlu
X2xvY2tfaW5pdCgmbWFzdGVyLT5pYmkubG9jayk7Cj4gIAltYXN0ZXItPmliaS5udW1fc2xvdHMg
PSBDT05GX1NUQVRVUzFfSUJJX0hXX1JFUyh2YWwpOwoKClRoYW5rcywKTWlxdcOobAoKLS0gCmxp
bnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
