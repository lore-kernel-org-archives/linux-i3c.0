Return-Path: <SRS0=Xn1S=HD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55703C433E0
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Feb 2021 09:31:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD31D64E30
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Feb 2021 09:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD31D64E30
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=21qXkESMWnFqe++aq14QWaIE/KkHKG2SV6+f841N/wo=; b=btSliWaSo4U1kyiqOErRF1OySx
	74kzsfC+ZNP+rd7Dgt9vT/PfAsIVRxK09I3Hy+j4e8g9UT4Tu2FQi+UJjvMrT4Jt0JSMbqpFZUEUd
	72am7cbbtAcceHRj0ceetmsjW72U4hHAC5BJTZsZZAZDjEaXzmx72HFtL3UA6H9engniyyRGG+v6N
	24TRrwnDQv3oZadTyRQewsoJAEuEptNyZyg6JPfK228kKiJb54U4+n26WXDTQs1QnTyvXfnNAtb2p
	cmCnUZL+uONlW1EOk7zEvW3+WG6sxtK9QwjhKJypCtovIDpKba/12W7YETKoxXFg3+8Wgqb7OGKt0
	qwwVNnrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6VY9-0007Ow-4x; Mon, 01 Feb 2021 09:31:13 +0000
Received: from metis.ext.pengutronix.de ([85.220.165.71])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l53M9-0008Aj-Pa
 for linux-i3c@lists.infradead.org; Thu, 28 Jan 2021 09:12:50 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l53K2-00069M-EB; Thu, 28 Jan 2021 10:10:38 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l53K1-0006X5-6C; Thu, 28 Jan 2021 10:10:37 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/2] i3c: Handle drivers without probe or remove callback
Date: Thu, 28 Jan 2021 10:10:31 +0100
Message-Id: <20210128091032.16952-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i3c@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_041249_851993_79531719 
X-CRM114-Status: GOOD (  14.85  )
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
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

QSByZWdpc3RlcmVkIGRyaXZlciB3aXRob3V0IGEgcHJvYmUgY2FsbGJhY2sgZG9lc24ndCBtYWtl
IHNlbnNlLCBzbwpyZWZ1c2UgdG8gcmVnaXN0ZXIgc3VjaCBhIGRyaXZlci4gKE90aGVyd2lzZSBp
M2NfZGV2aWNlX3Byb2JlKCkgeWllbGRzIGEKTlVMTCBwb2ludGVyIGV4Y2VwdGlvbi4pCgpBIGRy
aXZlciB3aXRob3V0IHJlbW92ZSBpcyBwb3NzaWJsZSwgZS5nLiB3aGVuIGFsbCByZXNvdXJjZXMg
YXJlIGZyZWVkCnVzaW5nIGRldm0gY2FsbGJhY2tzLiBTbyBndWFyZCB0aGUgY2FsbCB0byBkcml2
ZXItPnJlbW92ZSBieSBhIGNoZWNrCmZvciBiZWluZyBub24tTlVMTC4KCk5vdGUgdGhhdCB0aGUg
b25seSBpbi10cmVlIGkzYyBkcml2ZXIKKGRyaXZlcnMvaWlvL2ltdS9zdF9sc202ZHN4L3N0X2xz
bTZkc3hfaTNjLmMpIGRvZXNuJ3QgaGF2ZSBhIHJlbW92ZQpjYWxsYmFjay4KClNpZ25lZC1vZmYt
Ynk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0t
LQogZHJpdmVycy9pM2MvZGV2aWNlLmMgfCAgNSArKysrKwogZHJpdmVycy9pM2MvbWFzdGVyLmMg
fCAxMCArKysrKystLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvZGV2aWNlLmMgYi9kcml2ZXJzL2kz
Yy9kZXZpY2UuYwppbmRleCBiYjhlNjBkZmY5ODguLmU5MmQzZTlhNTJiZCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9pM2MvZGV2aWNlLmMKKysrIGIvZHJpdmVycy9pM2MvZGV2aWNlLmMKQEAgLTI2Miw2
ICsyNjIsMTEgQEAgaW50IGkzY19kcml2ZXJfcmVnaXN0ZXJfd2l0aF9vd25lcihzdHJ1Y3QgaTNj
X2RyaXZlciAqZHJ2LCBzdHJ1Y3QgbW9kdWxlICpvd25lcikKIAlkcnYtPmRyaXZlci5vd25lciA9
IG93bmVyOwogCWRydi0+ZHJpdmVyLmJ1cyA9ICZpM2NfYnVzX3R5cGU7CiAKKwlpZiAoIWRydi0+
cHJvYmUpIHsKKwkJcHJfZXJyKCJUcnlpbmcgdG8gcmVnaXN0ZXIgYW4gaTNjIGRyaXZlciB3aXRo
b3V0IHByb2JlIGNhbGxiYWNrXG4iKTsKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCiAJcmV0dXJu
IGRyaXZlcl9yZWdpc3RlcigmZHJ2LT5kcml2ZXIpOwogfQogRVhQT1JUX1NZTUJPTF9HUEwoaTNj
X2RyaXZlcl9yZWdpc3Rlcl93aXRoX293bmVyKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21h
c3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKaW5kZXggYjYxYmY1M2VjMDdhLi41N2E0ZjY5
OWViOGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci5jCisrKyBiL2RyaXZlcnMvaTNj
L21hc3Rlci5jCkBAIC0zMjYsMTEgKzMyNiwxMyBAQCBzdGF0aWMgaW50IGkzY19kZXZpY2VfcmVt
b3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgaTNjX2RldmljZSAqaTNjZGV2ID0g
ZGV2X3RvX2kzY2RldihkZXYpOwogCXN0cnVjdCBpM2NfZHJpdmVyICpkcml2ZXIgPSBkcnZfdG9f
aTNjZHJ2KGRldi0+ZHJpdmVyKTsKLQlpbnQgcmV0OworCWludCByZXQgPSAwOwogCi0JcmV0ID0g
ZHJpdmVyLT5yZW1vdmUoaTNjZGV2KTsKLQlpZiAocmV0KQotCQlyZXR1cm4gcmV0OworCWlmIChk
cml2ZXItPnJlbW92ZSkgeworCQlyZXQgPSBkcml2ZXItPnJlbW92ZShpM2NkZXYpOworCQlpZiAo
cmV0KQorCQkJcmV0dXJuIHJldDsKKwl9CiAKIAlpM2NfZGV2aWNlX2ZyZWVfaWJpKGkzY2Rldik7
CiAKLS0gCjIuMjkuMgoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtaTNjCg==
