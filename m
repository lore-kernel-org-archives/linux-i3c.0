Return-Path: <SRS0=Xn1S=HD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3011EC433DB
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Feb 2021 09:31:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C6D464EAB
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Feb 2021 09:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C6D464EAB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a4dxRfLrhiFUdOWepNik0e9nhoTdI4XuNlg9BnEt97Q=; b=wUoGrL1Ml1Ew6eaDS051JyZgo
	VbNlsHWYke5ryv+RvJIbCpnTILLKSbhCB0BDFSi/QZz8ipY2LzWQQYXMyVgvKjUnp8PZ/prm+CEjS
	nI0Jp75zih/lWGUbuLSMDmVw6RAN18qb5eoWTcEGAUSFUderDCIg3IKVcSepP8YKV015L3P+EEyKP
	yRJC3pzmBaDCbKPxLxnqEinlNqqWYZPgAsjfCzY2gVnaaX3lY1IXALxk3mnF6XIM57eBi36F8uE+f
	ffx+aCvSdhIHUcu/rLxjzBvD6/rlo7+vTvxC2NJJR5KS+8D7XAm7eBfVAlJSoUC5qsgZVz2gCR57v
	RkGNNGcxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6VY8-0007Oj-S9; Mon, 01 Feb 2021 09:31:12 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l53KJ-0007sn-5N
 for linux-i3c@lists.infradead.org; Thu, 28 Jan 2021 09:10:55 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l53KI-0006EQ-4a; Thu, 28 Jan 2021 10:10:54 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l53KH-00071Y-Rq; Thu, 28 Jan 2021 10:10:53 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/2] i3c: Make remove callback return void
Date: Thu, 28 Jan 2021 10:10:48 +0100
Message-Id: <20210128091048.17006-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128091048.17006-1-u.kleine-koenig@pengutronix.de>
References: <20210128091048.17006-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i3c@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_041055_248285_FB14B901 
X-CRM114-Status: GOOD (  16.23  )
X-Mailman-Approved-At: Mon, 01 Feb 2021 04:31:10 -0500
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

VGhlIGRyaXZlciBjb3JlIGlnbm9yZXMgdGhlIHJldHVybiB2YWx1ZSBvZiBzdHJ1Y3QgYnVzX3R5
cGU6OnJlbW92ZSgpCmJlY2F1c2UgdGhlcmUgaXMgb25seSBsaXR0bGUgdGhhdCBjYW4gYmUgZG9u
ZS4gVG8gc2ltcGxpZnkgdGhlIHF1ZXN0IHRvCm1ha2UgdGhpcyBmdW5jdGlvbiByZXR1cm4gdm9p
ZCwgbGV0IHN0cnVjdCBpM2NfZHJpdmVyOjpyZW1vdmUoKSByZXR1cm4Kdm9pZCwgdG9vLiBUaGlz
IG1ha2VzIGl0IG9idmlvdXMgdGhhdCByZXR1cm5pbmcgYW4gZXJyb3IgY29kZSBpcwphIGJhZCBp
ZGVhIGFuZCBmdXR1cmUgZHJpdmVyIGF1dGhvcnMgY2Fubm90IGdldCB0aGF0IHdyb25nLgoKVXAg
dG8gbm93IHRoZXJlIGFyZSBubyBkcml2ZXJzIHdpdGggYSByZW1vdmUgY2FsbGJhY2ssIHNvIHRo
ZXJlIGlzIG5vCm5lZWQgdG8gYWRhcHQgZHJpdmVycy4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVp
bmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9p
M2MvbWFzdGVyLmMgICAgICAgfCAxMCArKystLS0tLS0tCiBpbmNsdWRlL2xpbnV4L2kzYy9kZXZp
Y2UuaCB8ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21h
c3Rlci5jCmluZGV4IDU3YTRmNjk5ZWI4ZC4uZjhlOWI3MzA1YzEzIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2kzYy9tYXN0ZXIuYworKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwpAQCAtMzI2LDE3ICsz
MjYsMTMgQEAgc3RhdGljIGludCBpM2NfZGV2aWNlX3JlbW92ZShzdHJ1Y3QgZGV2aWNlICpkZXYp
CiB7CiAJc3RydWN0IGkzY19kZXZpY2UgKmkzY2RldiA9IGRldl90b19pM2NkZXYoZGV2KTsKIAlz
dHJ1Y3QgaTNjX2RyaXZlciAqZHJpdmVyID0gZHJ2X3RvX2kzY2RydihkZXYtPmRyaXZlcik7Ci0J
aW50IHJldCA9IDA7CiAKLQlpZiAoZHJpdmVyLT5yZW1vdmUpIHsKLQkJcmV0ID0gZHJpdmVyLT5y
ZW1vdmUoaTNjZGV2KTsKLQkJaWYgKHJldCkKLQkJCXJldHVybiByZXQ7Ci0JfQorCWlmIChkcml2
ZXItPnJlbW92ZSkKKwkJZHJpdmVyLT5yZW1vdmUoaTNjZGV2KTsKIAogCWkzY19kZXZpY2VfZnJl
ZV9pYmkoaTNjZGV2KTsKIAotCXJldHVybiByZXQ7CisJcmV0dXJuIDA7CiB9CiAKIHN0cnVjdCBi
dXNfdHlwZSBpM2NfYnVzX3R5cGUgPSB7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2kzYy9k
ZXZpY2UuaCBiL2luY2x1ZGUvbGludXgvaTNjL2RldmljZS5oCmluZGV4IGRlMTAyZTQ0MThhYi4u
ODI0MmUxM2U3YjBiIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2kzYy9kZXZpY2UuaAorKysg
Yi9pbmNsdWRlL2xpbnV4L2kzYy9kZXZpY2UuaApAQCAtMTc2LDcgKzE3Niw3IEBAIHN0cnVjdCBp
M2NfZGV2aWNlOwogc3RydWN0IGkzY19kcml2ZXIgewogCXN0cnVjdCBkZXZpY2VfZHJpdmVyIGRy
aXZlcjsKIAlpbnQgKCpwcm9iZSkoc3RydWN0IGkzY19kZXZpY2UgKmRldik7Ci0JaW50ICgqcmVt
b3ZlKShzdHJ1Y3QgaTNjX2RldmljZSAqZGV2KTsKKwl2b2lkICgqcmVtb3ZlKShzdHJ1Y3QgaTNj
X2RldmljZSAqZGV2KTsKIAljb25zdCBzdHJ1Y3QgaTNjX2RldmljZV9pZCAqaWRfdGFibGU7CiB9
OwogCi0tIAoyLjI5LjIKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWkzYwo=
