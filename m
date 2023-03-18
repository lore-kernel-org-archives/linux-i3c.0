Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE95BC761A6
	for <linux-i3c@archiver.kernel.org>; Sun, 19 Mar 2023 17:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hcrZolh8V+5bq8T5CBddmPXL8iMu5lpqa2Nu0RMRiJs=; b=TTaaIcswXhMczr
	OymgO8wx0MZFX4V144+ijiLjC1txijarQz5j1NJ6R+1MqUg/W58G8BSdc0lwSkCLZXTSDg6YdJNAe
	HIpFuRTbM226K80/QETjxGlIuLvfiQ/hpaqwNyBLTqEL8RNi1MrMCj2pEf75XJTvW84aKiS9rb0wd
	50CVDcSImUbDxMZ6BRPHpK6gQlHsL16OpxD10MK12bbTGzz0GIY7NNAimR7Qj0Vtzag5NAB2xMCYF
	onJ1bx2SiXP12/KlblHs4kh9XV1/ywHpcoQ4lmV9BpbHsGf1n9BL/K60clij10SgOPwEHYfWcCKbd
	pGh507dOYg1gPkMFkV9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdwVe-0074PH-0o;
	Sun, 19 Mar 2023 17:07:54 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdg3D-005ZUP-0c
	for linux-i3c@lists.infradead.org;
	Sat, 18 Mar 2023 23:33:29 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdg3A-00026H-3p; Sun, 19 Mar 2023 00:33:24 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdg39-0056VD-DB; Sun, 19 Mar 2023 00:33:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdg38-005zR4-Fu; Sun, 19 Mar 2023 00:33:22 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 5/5] i3c: svc: Convert to platform remove callback returning void
Date: Sun, 19 Mar 2023 00:33:11 +0100
Message-Id: <20230318233311.265186-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318233311.265186-1-u.kleine-koenig@pengutronix.de>
References: <20230318233311.265186-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=X1MRC8dZ6L3SY9IGorYLDJgu18rnXTtbRXFDOkbscEg=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhQxL8Md/hpp+5evtl9fKGT9fJLzvF9XPqhcNz1/cjb3g 3zXgonynYzGLAyMXAyyYoos9o1rMq2q5CI71/67DDOIlQlkCgMXpwBMZKI4+/8gw/X+1Qrqz9eE y2+e8j/SJuNiUZFaZqzwLo8VSUmtZqzGF0ryeyPDN3e1RT86ucMhM4GpukpGc4sgx5/5l5bOmCJ tPqU77oTR3b+32SSYtkW5rk/Pynj9keNb1W+NJ9EvEj/mebWbGHC+PB6bFdL52THOL4E1QtvvcK Alxzuj87Vyh/Wdtm6QY9RLd7q4Za9TqBib+43ZeTlPIgveCfmFfpnkELP6mKxM4gMZtfBTTm4zi /XcVtvuS9606urqMLm1UpkGusuSvJ8aZf9JOvxvzhu3BWzRT8qeqXdPF5k255THcymJexfky68p KLx/XnmCS9yP91JqJzv3d8aM+Ted5F1XTGpOjp/T9ZARAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i3c@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_163327_229466_86F1D225 
X-CRM114-Status: GOOD (  15.27  )
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
dmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNj
LW1hc3Rlci5jCmluZGV4IGU1NDc2ZDA0YjQwMy4uZTNmNDU0MTIzODA1IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYworKysgYi9kcml2ZXJzL2kzYy9tYXN0
ZXIvc3ZjLWkzYy1tYXN0ZXIuYwpAQCAtMTU2OSw3ICsxNTY5LDcgQEAgc3RhdGljIGludCBzdmNf
aTNjX21hc3Rlcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiBy
ZXQ7CiB9CiAKLXN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBzdmNfaTNjX21hc3Rlcl9yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3Rl
ciA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCkBAIC0xNTc3LDggKzE1NzcsNiBAQCBz
dGF0aWMgaW50IHN2Y19pM2NfbWFzdGVyX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQogCiAJcG1fcnVudGltZV9kb250X3VzZV9hdXRvc3VzcGVuZCgmcGRldi0+ZGV2KTsKIAlw
bV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7Ci0KLQlyZXR1cm4gMDsKIH0KIAogc3RhdGlj
IGludCBfX21heWJlX3VudXNlZCBzdmNfaTNjX3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNl
ICpkZXYpCkBAIC0xNjE2LDcgKzE2MTQsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBzdmNf
aTNjX21hc3Rlcl9vZl9tYXRjaF90YmwpOwogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZl
ciBzdmNfaTNjX21hc3RlciA9IHsKIAkucHJvYmUgPSBzdmNfaTNjX21hc3Rlcl9wcm9iZSwKLQku
cmVtb3ZlID0gc3ZjX2kzY19tYXN0ZXJfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gc3ZjX2kzY19t
YXN0ZXJfcmVtb3ZlLAogCS5kcml2ZXIgPSB7CiAJCS5uYW1lID0gInNpbHZhY28taTNjLW1hc3Rl
ciIsCiAJCS5vZl9tYXRjaF90YWJsZSA9IHN2Y19pM2NfbWFzdGVyX29mX21hdGNoX3RibCwKLS0g
CjIuMzkuMgoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtaTNjCg==
