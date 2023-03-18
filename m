Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06EBC761AF
	for <linux-i3c@archiver.kernel.org>; Sun, 19 Mar 2023 17:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g+957QiocKSz7qXmg6JCi2WjAfWaeqPaacHNmQGTf+o=; b=2enGzdcSumVesQ
	4bf0wiTVssuJ5iI8WpMq9piMwOWivIW/3xaJWk1OmT28fJy7JyKHtZf2fcfx6WdwX9h2nc1NOVuIh
	lV2v9DWMPgRV5iEEkq36ErLgjlDcNKyCVskMo3r3gHdT/MLHJAumvWuElrz9sGBlazVa5O/cEaQAi
	9LOWj2bV/j40/GpmV8dAe3mUmOHFy6+BCZK1SwZR1O8E9Ueq80FAi+SowJN5VFh98UYhTGep8C6ah
	cxzhM8k0GEDokZZb5g+vA3+EcEoQMYnLuHLc5RyqM6N5F1CmrvdaI9fCLOFQEI7alAv5vt5Z80oVw
	uGT0rK6YLNVO8LqYevTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdwVf-0074Ph-0O;
	Sun, 19 Mar 2023 17:07:55 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdg3D-005ZV5-2n
	for linux-i3c@lists.infradead.org;
	Sat, 18 Mar 2023 23:33:30 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdg3A-00026C-8d; Sun, 19 Mar 2023 00:33:24 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdg38-0056Uv-5N; Sun, 19 Mar 2023 00:33:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pdg37-005zQn-CV; Sun, 19 Mar 2023 00:33:21 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>
Cc: linux-i3c@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 0/5] i3c: Convert to platform remove callback returning void
Date: Sun, 19 Mar 2023 00:33:06 +0100
Message-Id: <20230318233311.265186-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=3Ju28ANkGZ7+0geMrnYg3N6xLtjhuflkWiZYKySYKWg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFkokktjz2r4BkWeJ3+jVJJW4erNC5cOsTP4e9 bsLr97JDPCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZKJAAKCRCPgPtYfRL+ TgITB/4zJ3FutDotfx2+sbWOlbSFw53JnEk5o35Ky9mvOGbwCeNRGpV96HScJ0JeMKYThxIMWKr YYw8lgeKtwZ7JCSANQg6DJsFgTPAgbgtxB5mZJ3fQLYaG4PJeKORgv0cXJhort+6uiTeHrpqMYD VNSzA/qjLsEfGk+Q6FMxahma5qn/pJB5fcs81+hGMkVdfEuP38STd6jG8FmW4Z3WI7ywgHROE6W Bnc1CJIshc00jj0k0y5mnpHXrlh3n30kVoL0nxZNjIFQryeMnqYMccgPWC6xwitrZ4PmaVa7++0 tIHndjtTzSq/zHXN5WgLAwhhyX0hjSHF/XpJfD4ob4ZK/oY3
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i3c@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_163327_934523_4956CC19 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8sCgp0aGlzIHNlcmllcyBhZGFwdHMgdGhlIHBsYXRmb3JtIGRyaXZlcnMgYmVsb3cgZHJp
dmVycy9pM2MgdG8gdXNlIHRoZQoucmVtb3ZlX25ldygpIGNhbGxiYWNrLiBDb21wYXJlZCB0byB0
aGUgdHJhZGl0aW9uYWwgLnJlbW92ZSgpIGNhbGxiYWNrCi5yZW1vdmVfbmV3KCkgcmV0dXJucyBu
byB2YWx1ZS4gVGhpcyBpcyBhIGdvb2QgdGhpbmcgYmVjYXVzZSB0aGUgZHJpdmVyIGNvcmUKZG9l
c24ndCAoYW5kIGNhbm5vdCkgY29wZSBmb3IgZXJyb3JzIGR1cmluZyByZW1vdmUuIFRoZSBvbmx5
IGVmZmVjdCBvZiBhCm5vbi16ZXJvIHJldHVybiB2YWx1ZSBpbiAucmVtb3ZlKCkgaXMgdGhhdCB0
aGUgZHJpdmVyIGNvcmUgZW1pdHMgYSB3YXJuaW5nLiBUaGUKZGV2aWNlIGlzIHJlbW92ZWQgYW55
aG93IGFuZCBhbiBlYXJseSByZXR1cm4gZnJvbSAucmVtb3ZlKCkgdXN1YWxseSB5aWVsZHMgYQpy
ZXNvdXJjZSBsZWFrLgoKQnkgY2hhbmdpbmcgdGhlIHJlbW92ZSBjYWxsYmFjayB0byByZXR1cm4g
dm9pZCBkcml2ZXIgYXV0aG9ycyBjYW5ub3QKcmVhc29uYWJseSBhc3N1bWUgYW55IG1vcmUgdGhh
dCB0aGVyZSBpcyBzb21lIGtpbmQgb2YgY2xlYW51cCBsYXRlci4KClRoZSBmaXJzdCBwYXRjaCBz
aW1wbGlmaWVzIHRoZSByZW1vdmUgY2FsbGJhY2tzIGJ5IG1ha2luZwppM2NfbWFzdGVyX3VucmVn
aXN0ZXIoKSByZXR1cm4gdm9pZC4gQWZ0ZXIgdGhhdCBhbGwgZHJpdmVycyBhcmUgY29udmVydGVk
CnRyaXZpYWxseSB0byAucmVtb3ZlX25ldygpLgoKQmVzdCByZWdhcmRzClV3ZQoKVXdlIEtsZWlu
ZS1Lw7ZuaWcgKDUpOgogIGkzYzogTWFrZSBpM2NfbWFzdGVyX3VucmVnaXN0ZXIoKSByZXR1cm4g
dm9pZAogIGkzYzogZHc6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVy
bmluZyB2b2lkCiAgaTNjOiBjZG5zOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFj
ayByZXR1cm5pbmcgdm9pZAogIGkzYzogbWlwaS1pM2MtaGNpOiBDb252ZXJ0IHRvIHBsYXRmb3Jt
IHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIGkzYzogc3ZjOiBDb252ZXJ0IHRvIHBs
YXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAoKIGRyaXZlcnMvaTNjL21hc3Rl
ci5jICAgICAgICAgICAgICAgICAgIHwgIDYgKy0tLS0tCiBkcml2ZXJzL2kzYy9tYXN0ZXIvZHct
aTNjLW1hc3Rlci5jICAgICB8IDExICsrKy0tLS0tLS0tCiBkcml2ZXJzL2kzYy9tYXN0ZXIvaTNj
LW1hc3Rlci1jZG5zLmMgICB8IDExICsrKy0tLS0tLS0tCiBkcml2ZXJzL2kzYy9tYXN0ZXIvbWlw
aS1pM2MtaGNpL2NvcmUuYyB8ICA2ICsrKy0tLQogZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2Mt
bWFzdGVyLmMgICAgfCAxMSArKystLS0tLS0tLQogaW5jbHVkZS9saW51eC9pM2MvbWFzdGVyLmgg
ICAgICAgICAgICAgfCAgMiArLQogNiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAz
MyBkZWxldGlvbnMoLSkKCgpiYXNlLWNvbW1pdDogZmUxNWMyNmVlMjZlZmExMTc0MWE3YjYzMmU5
ZjIzYjAxYWNhNGNjNgotLSAKMi4zOS4yCgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGlu
dXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1pM2MK
