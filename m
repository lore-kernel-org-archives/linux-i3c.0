Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D4DC7618E
	for <linux-i3c@archiver.kernel.org>; Sun, 19 Mar 2023 17:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDPySDHInyvX7uc/saWi/oKc+53BgnecNRNUQyaFLiw=; b=jfIA5KICUtwZeR
	vEoRyvLom0UpjSx+y/umcYDOgYKcOA/Utq52rWg0CjA0EQdxtmT2T71sjOcAs71JLrLpcv7aV+wg7
	cwuLpFz/4Pu8oarPRCpr3bnJiq+yIkxBoxInVShC3VR8nQfNxJ0YwSLf3z9dllvIwmu0cq5ZbDXrR
	OyGMh5lt10H8Mx6zWQtuy4SA6O7g+7M+IdXDURz2bao8qWLGEX0kGZ3PYDp4fevfoFU9fxxogxbbf
	Ed9zhCAdPxRHgSQASzt1MwwZVAyaecqpIHmrFYG/lU/+tFRnw8h7RoYL36Oc0pIhZ2x5dUoXDtePM
	YdVq5Da5rSdiF/SosCcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdwVd-0074P8-35;
	Sun, 19 Mar 2023 17:07:53 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdg3C-005ZUB-1t
	for linux-i3c@lists.infradead.org;
	Sat, 18 Mar 2023 23:33:27 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdg39-00026E-P6; Sun, 19 Mar 2023 00:33:23 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdg38-0056V4-Tz; Sun, 19 Mar 2023 00:33:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdg38-005zR0-9b; Sun, 19 Mar 2023 00:33:22 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 4/5] i3c: mipi-i3c-hci: Convert to platform remove callback returning void
Date: Sun, 19 Mar 2023 00:33:10 +0100
Message-Id: <20230318233311.265186-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318233311.265186-1-u.kleine-koenig@pengutronix.de>
References: <20230318233311.265186-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1695; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=nsieFt6mg9CaybaICqixNjISERpRyQorI3iQO6kK0k4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFkowfPkBNRUuGohmQbrKeNS+bStDp5DiRoswG yUIeOvxzGeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZKMAAKCRCPgPtYfRL+ TuylB/4rJ66LT4wux88L1Ai06G/JzO8wnwNVG92+S+kp8+UwlaPVwdU+nSonBmHGYK/dkR854OY ynsoLRJi+8bFzVz0Venj3tojA89Pljhek0iiFC4i7kt9wgXq0OmRXxPn6si9ONbyo5meKj1n9hg nYq873Hwpz3+zIwhZXCWn3fGIfmzrqT3WQLR5ccS8jSln+OtkECTnbRaL++Q37+IFKqPTQEUkqU fyMtddJG2gMV9sk0pCrtuAbjIUDW6Pql+O9GYPo8uTHGq1HXHe91yCObMZ1GtwVo55WNY1+Oz1h OHM5VfYJ/B982myhA15bjF+WncqqISoAJDGEZ9V6/a/MaZ5l
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i3c@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_163326_672771_7BBD5100 
X-CRM114-Status: GOOD (  15.61  )
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
dmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9t
aXBpLWkzYy1oY2kvY29yZS5jCmluZGV4IGY5YmM1ODM2NmE3Mi4uODM3YWY4M2M4NWY0IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYworKysgYi9kcml2
ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYwpAQCAtNzY1LDEzICs3NjUsMTEgQEAg
c3RhdGljIGludCBpM2NfaGNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJ
cmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgaTNjX2hjaV9yZW1vdmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIGkzY19oY2lfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IGkzY19oY2kgKmhjaSA9IHBsYXRmb3JtX2dldF9k
cnZkYXRhKHBkZXYpOwogCiAJaTNjX21hc3Rlcl91bnJlZ2lzdGVyKCZoY2ktPm1hc3Rlcik7Ci0K
LQlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGNvbnN0IF9fbWF5YmVfdW51c2VkIHN0cnVjdCBvZl9k
ZXZpY2VfaWQgaTNjX2hjaV9vZl9tYXRjaFtdID0gewpAQCAtNzgyLDcgKzc4MCw3IEBAIE1PRFVM
RV9ERVZJQ0VfVEFCTEUob2YsIGkzY19oY2lfb2ZfbWF0Y2gpOwogCiBzdGF0aWMgc3RydWN0IHBs
YXRmb3JtX2RyaXZlciBpM2NfaGNpX2RyaXZlciA9IHsKIAkucHJvYmUgPSBpM2NfaGNpX3Byb2Jl
LAotCS5yZW1vdmUgPSBpM2NfaGNpX3JlbW92ZSwKKwkucmVtb3ZlX25ldyA9IGkzY19oY2lfcmVt
b3ZlLAogCS5kcml2ZXIgPSB7CiAJCS5uYW1lID0gIm1pcGktaTNjLWhjaSIsCiAJCS5vZl9tYXRj
aF90YWJsZSA9IG9mX21hdGNoX3B0cihpM2NfaGNpX29mX21hdGNoKSwKLS0gCjIuMzkuMgoKCi0t
IApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
