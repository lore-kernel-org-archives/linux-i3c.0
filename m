Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCDFC6FD1F
	for <linux-i3c@archiver.kernel.org>; Sun, 19 Mar 2023 17:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ETXRVkNoL/PEZOG4bIsF2xmk5613L9K1H/h6Qq9vCgE=; b=4QnmOWMTEU/hLG
	NT7Mh3pzMt0M0gR1VLnzxo7Eodw5nnh/SCjpHz9saXSUEzezRgbY7dg3kP9iMO9xT87eBBjyBZi7V
	NQv218wCaRW8D1c/eF9zNex3QJkZA2oTbvTOW7QjDlcIwzeknoUJdZSZoUOikKyTcarA8/A+uG/AN
	g9fL4WMAKyyE7FntBbDe1dkESe4mFzSNRVUA4tEjBi6sYc2sw17KrNBMfCL3AN7aVyJxnfVUBnypM
	JJKNhPabL9V7z4ExM3hLpDsrB+QYpJl1wI1LjQTndPpnDEpOHE1VoVqgsXUGxehOQxN9+5l0C9ppJ
	q01ikovFoPepjYeniWCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdwVe-0074PX-2g;
	Sun, 19 Mar 2023 17:07:54 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdg3D-005ZV4-2Z
	for linux-i3c@lists.infradead.org;
	Sat, 18 Mar 2023 23:33:29 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdg3A-00026D-3d; Sun, 19 Mar 2023 00:33:24 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdg38-0056Uy-BS; Sun, 19 Mar 2023 00:33:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdg37-005zQq-JV; Sun, 19 Mar 2023 00:33:21 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>
Cc: linux-i3c@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 1/5] i3c: Make i3c_master_unregister() return void
Date: Sun, 19 Mar 2023 00:33:07 +0100
Message-Id: <20230318233311.265186-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318233311.265186-1-u.kleine-koenig@pengutronix.de>
References: <20230318233311.265186-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4365; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=L0YPQG1s3UCFY9B2X8LirGqav/q2tkZht5t/68x8vT0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFkotw+/CawB42NIRvubXFWwkQTub9EvueiwGC GhkdDrwgU2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZKLQAKCRCPgPtYfRL+ TrU1B/9kBrquqyKbehPSP4OcUTjtsbx+9YnwYPyuXxZRykf2xoSzgluApamrBykhNZAlCMG2V5j 8slNo9u+Q1fCPRuzlrTXxvJ0Ojhmr7srVvmuCGq8VIlenLp6CqfsrEudicZuynM+sSB1/M2FJnx hsjtgTRQBzycmskVbnfond37A2X2dS3IaAdAzM2iqXKybJESW7zr/H4kNLuqmI2fsbXB8UXfREL ohWFNHwKXIO7jw2Iye0T8USUOBuKQo8gfvSvIM6n2Ha3M6YJfNmxM65uSCXFIXa+SKPLIx50vlr k5GDRZVtEX0Sw3TmjUVKuS0w0DuNc6HzFAvnd++pmdYPdas2
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i3c@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_163327_831660_750B0E3C 
X-CRM114-Status: GOOD (  13.65  )
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

VGhlIGZ1bmN0aW9uIHJldHVybmVkIHplcm8gdW5jb25kaXRpb25hbGx5LiBTd2l0Y2ggdGhlIHJl
dHVybiB0eXBlIHRvIHZvaWQKYW5kIHNpbXBsaWZ5IHRoZSBjYWxsZXJzIGFjY29yZGluZ2x5LgoK
U2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRy
b25peC5kZT4KLS0tCiBkcml2ZXJzL2kzYy9tYXN0ZXIuYyAgICAgICAgICAgICAgICAgICB8IDYg
Ky0tLS0tCiBkcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jICAgICB8IDUgKy0tLS0K
IGRyaXZlcnMvaTNjL21hc3Rlci9pM2MtbWFzdGVyLWNkbnMuYyAgIHwgNSArLS0tLQogZHJpdmVy
cy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMgfCA0ICsrKy0KIGRyaXZlcnMvaTNjL21h
c3Rlci9zdmMtaTNjLW1hc3Rlci5jICAgIHwgNSArLS0tLQogaW5jbHVkZS9saW51eC9pM2MvbWFz
dGVyLmggICAgICAgICAgICAgfCAyICstCiA2IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgMTkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9k
cml2ZXJzL2kzYy9tYXN0ZXIuYwppbmRleCA1NGU0YzM0YjRhMjIuLjA0ZDZkNTRkMmFiOCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyLmMKKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMK
QEAgLTI2OTUsMTcgKzI2OTUsMTMgQEAgRVhQT1JUX1NZTUJPTF9HUEwoaTNjX21hc3Rlcl9yZWdp
c3Rlcik7CiAgKiBAbWFzdGVyOiBtYXN0ZXIgdXNlZCB0byBzZW5kIGZyYW1lcyBvbiB0aGUgYnVz
CiAgKgogICogQmFzaWNhbGx5IHVuZG8gZXZlcnl0aGluZyBkb25lIGluIGkzY19tYXN0ZXJfcmVn
aXN0ZXIoKS4KLSAqCi0gKiBSZXR1cm46IDAgaW4gY2FzZSBvZiBzdWNjZXNzLCBhIG5lZ2F0aXZl
IGVycm9yIGNvZGUgb3RoZXJ3aXNlLgogICovCi1pbnQgaTNjX21hc3Rlcl91bnJlZ2lzdGVyKHN0
cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlcikKK3ZvaWQgaTNjX21hc3Rlcl91bnJl
Z2lzdGVyKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlcikKIHsKIAlpM2NfbWFz
dGVyX2kyY19hZGFwdGVyX2NsZWFudXAobWFzdGVyKTsKIAlpM2NfbWFzdGVyX3VucmVnaXN0ZXJf
aTNjX2RldnMobWFzdGVyKTsKIAlpM2NfbWFzdGVyX2J1c19jbGVhbnVwKG1hc3Rlcik7CiAJZGV2
aWNlX3VucmVnaXN0ZXIoJm1hc3Rlci0+ZGV2KTsKLQotCXJldHVybiAwOwogfQogRVhQT1JUX1NZ
TUJPTF9HUEwoaTNjX21hc3Rlcl91bnJlZ2lzdGVyKTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
M2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFz
dGVyLmMKaW5kZXggNDg5NTRkM2U2NTcxLi43MTM1ZGFhZGEzZTMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL2R3
LWkzYy1tYXN0ZXIuYwpAQCAtMTE4NSwxMSArMTE4NSw4IEBAIHN0YXRpYyBpbnQgZHdfaTNjX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiBzdGF0aWMgaW50IGR3X2kzY19yZW1v
dmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgZHdfaTNjX21hc3Rl
ciAqbWFzdGVyID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7Ci0JaW50IHJldDsKIAotCXJl
dCA9IGkzY19tYXN0ZXJfdW5yZWdpc3RlcigmbWFzdGVyLT5iYXNlKTsKLQlpZiAocmV0KQotCQly
ZXR1cm4gcmV0OworCWkzY19tYXN0ZXJfdW5yZWdpc3RlcigmbWFzdGVyLT5iYXNlKTsKIAogCXJl
c2V0X2NvbnRyb2xfYXNzZXJ0KG1hc3Rlci0+Y29yZV9yc3QpOwogCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2kzYy9tYXN0ZXIvaTNjLW1hc3Rlci1jZG5zLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvaTNj
LW1hc3Rlci1jZG5zLmMKaW5kZXggNWIzN2ZmZTVhZDViLi40NTQ5MjVjNWUwOTcgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvaTNjL21hc3Rlci9pM2MtbWFzdGVyLWNkbnMuYworKysgYi9kcml2ZXJzL2kz
Yy9tYXN0ZXIvaTNjLW1hc3Rlci1jZG5zLmMKQEAgLTE2NjUsMTEgKzE2NjUsOCBAQCBzdGF0aWMg
aW50IGNkbnNfaTNjX21hc3Rlcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
c3RhdGljIGludCBjZG5zX2kzY19tYXN0ZXJfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiB7CiAJc3RydWN0IGNkbnNfaTNjX21hc3RlciAqbWFzdGVyID0gcGxhdGZvcm1fZ2V0
X2RydmRhdGEocGRldik7Ci0JaW50IHJldDsKIAotCXJldCA9IGkzY19tYXN0ZXJfdW5yZWdpc3Rl
cigmbWFzdGVyLT5iYXNlKTsKLQlpZiAocmV0KQotCQlyZXR1cm4gcmV0OworCWkzY19tYXN0ZXJf
dW5yZWdpc3RlcigmbWFzdGVyLT5iYXNlKTsKIAogCWNsa19kaXNhYmxlX3VucHJlcGFyZShtYXN0
ZXItPnN5c2Nsayk7CiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG1hc3Rlci0+cGNsayk7CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYyBiL2RyaXZlcnMv
aTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jCmluZGV4IDZhZWY1Y2U0M2NjMS4uZjliYzU4
MzY2YTcyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUu
YworKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYwpAQCAtNzY5LDcg
Kzc2OSw5IEBAIHN0YXRpYyBpbnQgaTNjX2hjaV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIHsKIAlzdHJ1Y3QgaTNjX2hjaSAqaGNpID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEo
cGRldik7CiAKLQlyZXR1cm4gaTNjX21hc3Rlcl91bnJlZ2lzdGVyKCZoY2ktPm1hc3Rlcik7CisJ
aTNjX21hc3Rlcl91bnJlZ2lzdGVyKCZoY2ktPm1hc3Rlcik7CisKKwlyZXR1cm4gMDsKIH0KIAog
c3RhdGljIGNvbnN0IF9fbWF5YmVfdW51c2VkIHN0cnVjdCBvZl9kZXZpY2VfaWQgaTNjX2hjaV9v
Zl9tYXRjaFtdID0gewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFz
dGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwppbmRleCBkNmU5ZWQ3
NGNkY2YuLmU1NDc2ZDA0YjQwMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1p
M2MtbWFzdGVyLmMKKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKQEAg
LTE1NzIsMTEgKzE1NzIsOCBAQCBzdGF0aWMgaW50IHN2Y19pM2NfbWFzdGVyX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiBzdGF0aWMgaW50IHN2Y19pM2NfbWFzdGVyX3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBzdmNfaTNjX21hc3Rl
ciAqbWFzdGVyID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7Ci0JaW50IHJldDsKIAotCXJl
dCA9IGkzY19tYXN0ZXJfdW5yZWdpc3RlcigmbWFzdGVyLT5iYXNlKTsKLQlpZiAocmV0KQotCQly
ZXR1cm4gcmV0OworCWkzY19tYXN0ZXJfdW5yZWdpc3RlcigmbWFzdGVyLT5iYXNlKTsKIAogCXBt
X3J1bnRpbWVfZG9udF91c2VfYXV0b3N1c3BlbmQoJnBkZXYtPmRldik7CiAJcG1fcnVudGltZV9k
aXNhYmxlKCZwZGV2LT5kZXYpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pM2MvbWFzdGVy
LmggYi9pbmNsdWRlL2xpbnV4L2kzYy9tYXN0ZXIuaAppbmRleCA2MDRhMTI2Yjc4YzguLjRiN2Ji
NDNiZjQzMCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9pM2MvbWFzdGVyLmgKKysrIGIvaW5j
bHVkZS9saW51eC9pM2MvbWFzdGVyLmgKQEAgLTU0MSw3ICs1NDEsNyBAQCBpbnQgaTNjX21hc3Rl
cl9yZWdpc3RlcihzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIsCiAJCQlzdHJ1
Y3QgZGV2aWNlICpwYXJlbnQsCiAJCQljb25zdCBzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVy
X29wcyAqb3BzLAogCQkJYm9vbCBzZWNvbmRhcnkpOwotaW50IGkzY19tYXN0ZXJfdW5yZWdpc3Rl
cihzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIpOwordm9pZCBpM2NfbWFzdGVy
X3VucmVnaXN0ZXIoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyKTsKIAogLyoq
CiAgKiBpM2NfZGV2X2dldF9tYXN0ZXJfZGF0YSgpIC0gZ2V0IG1hc3RlciBwcml2YXRlIGRhdGEg
YXR0YWNoZWQgdG8gYW4gSTNDCi0tIAoyLjM5LjIKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlz
dApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
