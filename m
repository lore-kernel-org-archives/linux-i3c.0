Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E348AC76195
	for <linux-i3c@archiver.kernel.org>; Sun, 19 Mar 2023 17:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxpB+r8VhVA4t0OvVDNcRZ5XOZpfs/rLxcBVflSG7Og=; b=xSVHhy0TAwyxMZ
	wOwL/UytK+wkGXzY4IgeE2q21pHAW9vk14ZQsYhIVm26P4/GwrwEsRJ33fphW5zkeBWrl+0Vsa1w2
	s17peqFbvVF9nwOF2Ol2k9MoNkRmVNhAL4jwL1ZtZe4ulKg0Xt8fzFqdtZWrhdDFq7YxRxM1xBgP/
	ip/2Gg/zAE4Kz1ywXLX4wmrro3Jn7m7snAFs4yJpVDc85gCIVoQKc5Zi9mCZqllfDnc7m5dC0ZTXR
	WpCQ2bzSnj9ZMpCw3fDKkgAm4ONmnwsYHDkDko/VOAVga3kZuaajg2wGKuX2gI81kjk/vsIwPvSjO
	IVyrd2EI4+cm8CmLMotA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdwVe-0074PO-1o;
	Sun, 19 Mar 2023 17:07:54 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdg3C-005ZUF-1t
	for linux-i3c@lists.infradead.org;
	Sat, 18 Mar 2023 23:33:29 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdg39-00026G-R0; Sun, 19 Mar 2023 00:33:23 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdg39-0056V8-11; Sun, 19 Mar 2023 00:33:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdg38-005zQw-2m; Sun, 19 Mar 2023 00:33:22 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 3/5] i3c: cdns: Convert to platform remove callback returning void
Date: Sun, 19 Mar 2023 00:33:09 +0100
Message-Id: <20230318233311.265186-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318233311.265186-1-u.kleine-koenig@pengutronix.de>
References: <20230318233311.265186-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=8roCA0Odkx2Qe+8O5bBbJPRTbaX7hFvW3o6ZvVO0byw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFkovGERkF8KP481dmK3ldmgOoNdksd3JAmxkL wfDgKrlfquJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZKLwAKCRCPgPtYfRL+ Tv5YB/9SAcNUuhPrU9qTlmCd1ikg8AwS4zMuqd04M3JU/a6tfOEq/yDdt7OrUhwh9rpiAQAsnxY pp701cY0fJI5ltjz4KX3U5+Dbwyzs8F75sVeR03ElYZsPyiNILb7vxdExlH+lxNQd3KxGH7KGm7 VLOgyeycDQKz4aoj/65am08aGmLbfnVKM3hIPzlwmvxdNsG/2TvVW85QFQzIOpshUzisZXT4wmN 3p7fu56R//o7N+/+Q8B9Sdo1KSc00LkN8nS3YwT9uGOTnPziXl8+CeGGnkr8qTj9dPh8fL82/wc lWSqFFFS7VA0uexE3FOWorcas81qvzBP+0MtAiYVUHl175wR
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i3c@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_163326_672914_4B2B9A57 
X-CRM114-Status: GOOD (  15.28  )
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
dmVycy9pM2MvbWFzdGVyL2kzYy1tYXN0ZXItY2Rucy5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pM2MvbWFzdGVyL2kzYy1tYXN0ZXItY2Rucy5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL2kzYy1t
YXN0ZXItY2Rucy5jCmluZGV4IDQ1NDkyNWM1ZTA5Ny4uMDE2MTBmYTViMGNjIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2kzYy9tYXN0ZXIvaTNjLW1hc3Rlci1jZG5zLmMKKysrIGIvZHJpdmVycy9pM2Mv
bWFzdGVyL2kzYy1tYXN0ZXItY2Rucy5jCkBAIC0xNjYyLDcgKzE2NjIsNyBAQCBzdGF0aWMgaW50
IGNkbnNfaTNjX21hc3Rlcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJl
dHVybiByZXQ7CiB9CiAKLXN0YXRpYyBpbnQgY2Ruc19pM2NfbWFzdGVyX3JlbW92ZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgY2Ruc19pM2NfbWFzdGVyX3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBjZG5zX2kzY19tYXN0
ZXIgKm1hc3RlciA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCkBAIC0xNjcwLDEzICsx
NjcwLDExIEBAIHN0YXRpYyBpbnQgY2Ruc19pM2NfbWFzdGVyX3JlbW92ZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogCiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG1hc3Rlci0+c3lzY2xr
KTsKIAljbGtfZGlzYWJsZV91bnByZXBhcmUobWFzdGVyLT5wY2xrKTsKLQotCXJldHVybiAwOwog
fQogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBjZG5zX2kzY19tYXN0ZXIgPSB7CiAJ
LnByb2JlID0gY2Ruc19pM2NfbWFzdGVyX3Byb2JlLAotCS5yZW1vdmUgPSBjZG5zX2kzY19tYXN0
ZXJfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gY2Ruc19pM2NfbWFzdGVyX3JlbW92ZSwKIAkuZHJp
dmVyID0gewogCQkubmFtZSA9ICJjZG5zLWkzYy1tYXN0ZXIiLAogCQkub2ZfbWF0Y2hfdGFibGUg
PSBjZG5zX2kzY19tYXN0ZXJfb2ZfaWRzLAotLSAKMi4zOS4yCgoKLS0gCmxpbnV4LWkzYyBtYWls
aW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
