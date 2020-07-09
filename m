Return-Path: <SRS0=5SuJ=AU=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB063C433DF
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Jul 2020 07:24:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A79CF2070E
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Jul 2020 07:24:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="STUZHOEd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A79CF2070E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RXzbB52ta8AEqngWUca9GtkFUakeyiAtZR6Qwjqh8OU=; b=STUZHOEdQ7yyOycD3+lWkeLpsf
	jlhHLltnWqc/m5XYM3cU6ymjylv7osiJ7g0pN2vtfJr7AhG6PBwFcfTMai2Uj6v+G8PtoN9UmxojL
	3lehB6M04iyabI8ALEmW9T2VS+7kegO/BFWYXaPkh/1t4ciBvuRp8NKkTHok3hXQ0DY7u8xg3Gvj6
	fV800Qdthj9s7F2lxS9Nw6BWJoLr79qLPDf0PxukvKrytnlrXICmrOVHsDqMaZ536WfJ1xWSHq6GG
	JENJAkpqKr8oZ/K+y1FXJSN04ZdYl3XShIBAGUhlqvzanCNtFoZA41PL8Upc7wWGikOTW0ThOev8M
	Dmt1z53g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtQuq-0002Zf-0n
	for linux-i3c@archiver.kernel.org; Thu, 09 Jul 2020 07:24:20 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtQun-0002ZE-HL
 for linux-i3c@lists.infradead.org; Thu, 09 Jul 2020 07:24:18 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id DE0CA100014;
 Thu,  9 Jul 2020 07:24:12 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-i3c@lists.infradead.org
Subject: [RESEND PATCH] i3c: master: dw: Drop redundant disec call
Date: Thu,  9 Jul 2020 09:24:11 +0200
Message-Id: <20200709072411.1413-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_032417_850493_9C0451A6 
X-CRM114-Status: UNSURE (   5.29  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vitor Soares <vitor.soares@synopsys.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

RGlzYWJsaW5nIGFsbCBldmVudCBjYWxscyBpcyBhbHJlYWR5IGhhbmRsZWQgYnkgdGhlIGNvcmUg
cmlnaHQgYmVmb3JlCnN0YXJ0aW5nIHRoZSBEQUEgcHJvY2Vzcy4gRG8gbm90IGRvIGl0IGFnYWlu
IHdoZW4gdGhlIERBQSBwcm9jZXNzCmNvbXBsZXRlcywgaXQgaXMgcmVkdW5kYW50LgoKRml4ZXM6
IDFkZDcyOGY1ZDRkNCAoImkzYzogbWFzdGVyOiBBZGQgZHJpdmVyIGZvciBTeW5vcHN5cyBEZXNp
Z25XYXJlIElQIikKU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4KLS0tCgpIZWxsbywKClNvcnJ5IGZvciBzcGFtbWluZyB0aGUgcGVyc29ucyBp
biBDYzosIEkgYW0gcmVzZW5kaW5nIGJlY2F1c2UgSSB3YXMKbm90IHN1YnNjcmliZWQgdG8gdGhl
IE1MLgoKTWlxdcOobAoKIGRyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMgfCA1IC0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1t
YXN0ZXIuYwppbmRleCA1YzUzMDZjZDUwZWMuLmM2NWFhZTU4OWIyOSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYworKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIv
ZHctaTNjLW1hc3Rlci5jCkBAIC04MTYsMTEgKzgxNiw2IEBAIHN0YXRpYyBpbnQgZHdfaTNjX21h
c3Rlcl9kYWEoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbSkKIAogCWR3X2kzY19tYXN0
ZXJfZnJlZV94ZmVyKHhmZXIpOwogCi0JaTNjX21hc3Rlcl9kaXNlY19sb2NrZWQobSwgSTNDX0JS
T0FEQ0FTVF9BRERSLAotCQkJCUkzQ19DQ0NfRVZFTlRfSEogfAotCQkJCUkzQ19DQ0NfRVZFTlRf
TVIgfAotCQkJCUkzQ19DQ0NfRVZFTlRfU0lSKTsKLQogCXJldHVybiAwOwogfQogCi0tIAoyLjIw
LjEKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkz
Ywo=
