Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68136C7618A
	for <linux-i3c@archiver.kernel.org>; Sun, 19 Mar 2023 17:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhCvOnjccRfE0NROUmxhUIDoh0wkQbMS10WQsf9h8Co=; b=h1QHzeLM1RH3Tu
	dFDUIk2xh3VVOPHg5wpFupYjE9X+K7Ru557Jn/Ks1Ib+iZUi5RrmQ1P/BzIwBRwusnL17O25/MUT9
	0XMZtc9G5wnKWnnsSV8Js2TdMfJ1rGFmZIOMdpvWkmw+DfldivR9e4umEFZiHkHOyqOTCx/OKe1eJ
	kwnG7mUCKgLNxj/S8b1yEdvWLvuTn9gJbHeNVmeCXXFg3bceEr0MENhcSgzGEIxYqaIRjQpHMSFJn
	Z4+X+J52q2952e3WhcjvsRRgknI2vGt9LvzuG6zOQy2JQpDyqmrfya6A0fB05GVjwG3zUMumfheFJ
	vw3ptrSuFFGE6xrlelFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdwVd-0074P3-1W;
	Sun, 19 Mar 2023 17:07:53 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdg3C-005ZUA-1t
	for linux-i3c@lists.infradead.org;
	Sat, 18 Mar 2023 23:33:27 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdg39-00026F-P5; Sun, 19 Mar 2023 00:33:23 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdg39-0056V7-0L; Sun, 19 Mar 2023 00:33:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdg37-005zQt-Pq; Sun, 19 Mar 2023 00:33:21 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 2/5] i3c: dw: Convert to platform remove callback returning void
Date: Sun, 19 Mar 2023 00:33:08 +0100
Message-Id: <20230318233311.265186-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318233311.265186-1-u.kleine-koenig@pengutronix.de>
References: <20230318233311.265186-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1813; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=htTuUT4c/2CCmv0QHZ6AOTyXnCc1zupZ0qWEhfKT3Ow=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFkouXH20m1uYEZXD20y2TttfZFqDt8qp8SzlO l89RghdcPOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZKLgAKCRCPgPtYfRL+ Tlo7CAC7bYv+krow+fzsxEQdRKIMng3ol0TOBGvseQ2UVcptAjOHRGchXKZZZFleLWXJMm+lS04 zTzarw4pl05iJfBwxKgRbk7vP68QbuSH4Jq1MdSCmLLL1298pk2JJ/XrZI9xJCur1CBg6t1QmwW lt8PITNNSoWo2a4t7CVYl2Iic3x+J2q+nseLFPtcY2sqojHM3pf3whB+ttM6iBB2cm40NQAGWFV TuU2n9p2vcIs5XnaKx9LgWSNmOHPS2ebhwfmMM8AWifujeoYYxsDDyvZp1yv8jICeGaw9mkkVoe YLXtFpUN8GNBm87GnRsJPOmUCNjmrSdOtoFBehd+Pl+VWRwi
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i3c@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_163326_672771_2DE33E66 
X-CRM114-Status: GOOD (  15.66  )
X-Mailman-Approved-At: Sun, 19 Mar 2023 10:07:52 -0700
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

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCmFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUg
aXMgYQpxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAu
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpj
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJp
dmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1h
c3Rlci5jCmluZGV4IDcxMzVkYWFkYTNlMy4uZjVkM2I3YzA0Yzg4IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jCisrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9k
dy1pM2MtbWFzdGVyLmMKQEAgLTExODIsNyArMTE4Miw3IEBAIHN0YXRpYyBpbnQgZHdfaTNjX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3Rh
dGljIGludCBkd19pM2NfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0
aWMgdm9pZCBkd19pM2NfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJ
c3RydWN0IGR3X2kzY19tYXN0ZXIgKm1hc3RlciA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYp
OwogCkBAIC0xMTkxLDggKzExOTEsNiBAQCBzdGF0aWMgaW50IGR3X2kzY19yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXNldF9jb250cm9sX2Fzc2VydChtYXN0ZXItPmNv
cmVfcnN0KTsKIAogCWNsa19kaXNhYmxlX3VucHJlcGFyZShtYXN0ZXItPmNvcmVfY2xrKTsKLQot
CXJldHVybiAwOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBkd19pM2Nf
bWFzdGVyX29mX21hdGNoW10gPSB7CkBAIC0xMjAzLDcgKzEyMDEsNyBAQCBNT0RVTEVfREVWSUNF
X1RBQkxFKG9mLCBkd19pM2NfbWFzdGVyX29mX21hdGNoKTsKIAogc3RhdGljIHN0cnVjdCBwbGF0
Zm9ybV9kcml2ZXIgZHdfaTNjX2RyaXZlciA9IHsKIAkucHJvYmUgPSBkd19pM2NfcHJvYmUsCi0J
LnJlbW92ZSA9IGR3X2kzY19yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBkd19pM2NfcmVtb3ZlLAog
CS5kcml2ZXIgPSB7CiAJCS5uYW1lID0gImR3LWkzYy1tYXN0ZXIiLAogCQkub2ZfbWF0Y2hfdGFi
bGUgPSBvZl9tYXRjaF9wdHIoZHdfaTNjX21hc3Rlcl9vZl9tYXRjaCksCi0tIAoyLjM5LjIKCgot
LSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
