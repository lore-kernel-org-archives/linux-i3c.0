Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C27ECD98E4
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 14:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JXtGIgWm8HiERfs+NmeiAxhdtlIpoJ1PO4alLjaQV74=; b=iIwVfS7bPAaH4N
	qDOjczclRuze0ThQ5dRKMDaiDE6pNmA3LcpqOAXEJp34VHnFK+OtzYYMlogEubj2Li7+9EOaBB/GC
	vM5RyaU41ns928tJXkBPvl1OBppW0mWgRL8fV1d8gKpxemUrEJTKfd+vX8+AJhkGSPO2+KmE91YP7
	py39ycWZtfh3C3eube/1QJVaI/4LI6gbNACOQUAQ1AWkXqIn0/qwPxyRnQtEWyw3p1ksTYg+nVjtB
	epy7YhjB1cyhRPLuoqqqbEuw+V/4ump334o3Yj2N64KkqzImq7H8OABG72RKf5dBFReRs/pcEiomn
	/e1lph9D851n/jZmDnHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUsH-0000000Fvg2-1bYb;
	Tue, 16 Jun 2026 14:34:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUsE-0000000Fvf7-1Azx
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 14:34:43 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso27678355e9.0
        for <linux-i3c@lists.infradead.org>; Tue, 16 Jun 2026 07:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781620480; x=1782225280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BG+93e8oTKjGC9fwcPkToC92gpeS0uZWt2ClVePm0o0=;
        b=dJsENt8t8GEPKJs6L9wvQgzt7NGKEklwr3ApKgKImNlO7pAosZznsyTHOd8zKM2Oem
         +c/hryeRmzHGc3dKtzxo7dGIvvtSVVASvDCU0jnW0xeijOxHtLu8ttulFM5qOi/HMPQi
         Z5q118JdpfRHR7YjBGEocvv45RcqnIda6ozbfOBMhrEALRHUgITrNkDgRLTl9DqUh0Dy
         ji/VCoQBaF5AbiMnH+cAkl4bk4NO+VFr/yJNw4rFFKJkmx0OnDJgewB/qXRV/RSRi432
         GfoY3pBSsuH74wk+F8tPYyT+1mdS18WBeTdKtaN5082gM3rM23lkaKjNHapiKedUR0EU
         Bekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781620480; x=1782225280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BG+93e8oTKjGC9fwcPkToC92gpeS0uZWt2ClVePm0o0=;
        b=a/DgbTbhYjrIRi4Nl1tunGZDzlra7dmqNXTihtRhxa2a9ufrgidVO4u6d7MresabEd
         Mxby0dhZF3mq7MdGMz2nCrD+as0pqzXFV2xmfh1hG0s3fxOGUPwE5pm6unCIoSaBmAs0
         nUJ7EY34spi0WpmTvqW94Fh1AvJKg2ls2pIQSbBT0IQjJYG+zLt+rVVP6OV2nir+alzE
         VmnoKhShBPtxoHsdxNecXF9HkxeYwmcB7aRqrLwAgOdB3LpbLftDl1F+26bzbjK1ooJj
         hRQGzTy608XlOiZISlRJ8NBunEoArlC6wB1VKzw9IW/FlO5J0NYoXcpI5gMvU+LaW5Ws
         iUPA==
X-Forwarded-Encrypted: i=1; AFNElJ+Osr9XdpsBKDzfCCKqVEC9CVeJq+9uf4FqPooC+Q2B4ujySzRU+wFAKffsEnIIWlRyI6dZYP9BNMY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1zX+LMV07voxa9BQ7bB4QzXiQjsgimEEB25VoIgtEuUX9inr6
	GzGJyLCuuRiXRvLQF4DrvgMKzq7iT+l/o+qwaeG+gtfVEQCb/6ciBf+hIm3Bh7GrwKE=
X-Gm-Gg: Acq92OF/eHxqwzdJpz11eFhApKfpVzQ8KRRwpmihBt64tPR11PAzysVrZzXDlpBpWuV
	ozf5JXu/AS9YWkIYVo7uh7vPbXddCUCO0PJNSXHHPj8jN5w2UQppa1EfZvaptDv6ZcVbXwcSb11
	GRln5LowdNapkOSxdliNmPNQGkHbXeR7yni7DKGDvHsxcgst3lSct2zi6KbwPdleXvkqrcz20IM
	mkXxybf9tSNU2UbCRJQ5FMEPYUANfgoqRyzTm1W7CWF1ny1BVr1JogWtUFDp5HGagkJpo9q5vlA
	2bgTifVKOpo5y6fw1wr53KBZRkvrtUcTOLni3EJG5v4zK80/V1Xb8u4rGOWN8fMCnfcnO93KR2I
	LiMf0xtqoHo5sWZoF//v9xKlJOlAjgng/w+Xs1OLRgNM9TIirLkN3qVvbSZQXMtjRYjQDxkGDj6
	4mBGVZuvkg6b3hCPBClKk4g32851L45fnBJYcKItuK81EEjEJqQfIQ16mudlMxBIF7ZlBPUUz5t
	/ezNQ8wLzhn2Ho=
X-Received: by 2002:a05:600c:871b:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-4922faf9ec8mr56476865e9.14.1781620479690;
        Tue, 16 Jun 2026 07:34:39 -0700 (PDT)
Received: from localhost (p200300f65f47db04ed78e379f226b032.dip0.t-ipconnect.de. [2003:f6:5f47:db04:ed78:e379:f226:b032])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4922fa97a07sm140223425e9.14.2026.06.16.07.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 07:34:39 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] i3c: mipi-i3c-hci: Use named initializers for platform_device_id's .driver_data
Date: Tue, 16 Jun 2026 16:34:20 +0200
Message-ID: <7c006616f72748fb4deccd197ca2b6427c006f79.1781620397.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1572; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=h/p+OVU0KJDGy2EumHN+sSlIkOSFNSYaLsg+5SYPsxY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqMV7st1aJyaafqIOETT6Z0v7BSI3pP++ML5pCk yLOuccOYKiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCajFe7AAKCRCPgPtYfRL+ TqZFCACS7MTYFvnTo7BPnrJA1IkuusXXVVUQg/vOMhmByTDVSY6LrDrFxIuhT1isa3X0VM7ra7p JhUrC528ItX6+XT8Hn57XkFbdwQrnmjA4AMWZXt9nq9QAcv1tDU7f+cQppvnIhvd4YansAdXvTV OIcDqWYyd8XxnzAeh82v5JDX6FHPO3G4ImEbpMt5j9EpvalVw55L2wLHnXDGE+0/5QnSNua8VAC Fm+AATxaSdUb4vG1VhA0hkQ+Uw6haOZEdLBRWBWQO4RNpEYZJ6fj6EVKx2Gq8LLgyFh4hdAjiz8 g88mCzrhqmtstfGJC9XlpgXO7TXqiI5N6aVrR3Xhpp+Om1GJ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_073442_337540_638CC433 
X-CRM114-Status: GOOD (  11.84  )
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

VGhlIGFzc2lnbm1lbnQgaW4gdGhpcyBkcml2ZXIgdXNlcyBhIG1peGVkIHdheSB0byBpbml0aWFs
aXplIHRoZQpwbGF0Zm9ybV9kZXZpY2VfaWQgYXJyYXkuIC5uYW1lIGlzIGFzc2lnbmVkIGJ5IG5h
bWUgYW5kIC5kcml2ZXJfZGF0YSBieQpwb3NpdGlvbi4gVW5pZnkgdGhhdCB0byB1c2UgbmFtZWQg
YXNzaWdubWVudCBmb3IgYm90aCBzdHJ1Y3QgbWVtYmVycy4KVGhpcyBpcyBuZWVkZWQgZm9yIGEg
cGxhbm5lZCBjaGFuZ2UgdG8gc3RydWN0IHBsYXRmb3JtX2RldmljZV9pZApyZXBsYWNpbmcgLmRy
aXZlcl9kYXRhIGJ5IGFuIGFub255bW91cyB1bmlvbi4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVp
bmUtS8O2bmlnIChUaGUgQ2FwYWJsZSBIdWIpIDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29t
PgotLS0KIGRyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jIHwgMTMgKysrKysr
KystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYyBiL2Ry
aXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jCmluZGV4IDNhM2E5YTNkNGRlYy4u
ZTgwYWExZjU3MjJlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNp
L2NvcmUuYworKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYwpAQCAt
MTE4OSwxMSArMTE4OSwxNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFjcGlfZGV2aWNlX2lkIGkz
Y19oY2lfYWNwaV9tYXRjaFtdID0gewogTU9EVUxFX0RFVklDRV9UQUJMRShhY3BpLCBpM2NfaGNp
X2FjcGlfbWF0Y2gpOwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHBsYXRmb3JtX2RldmljZV9pZCBp
M2NfaGNpX2RyaXZlcl9pZHNbXSA9IHsKLQl7IC5uYW1lID0gImludGVsLWxwc3MtaTNjIiwgSENJ
X1FVSVJLX1JQTV9BTExPV0VEIHwKLQkJCQkgICAgSENJX1FVSVJLX1JQTV9JQklfQUxMT1dFRCB8
Ci0JCQkJICAgIEhDSV9RVUlSS19SUE1fUEFSRU5UX01BTkFHRUQgfAotCQkJCSAgICBIQ0lfUVVJ
UktfRE1BX0FCT1JUX1JFUVVJUkVTX1BJT19SRVNFVCB8Ci0JCQkJICAgIEhDSV9RVUlSS19ETUFf
UkVRVUlSRVNfSENfQUJPUlQgfSwKKwl7CisJCS5uYW1lID0gImludGVsLWxwc3MtaTNjIiwKKwkJ
LmRyaXZlcl9kYXRhID0gSENJX1FVSVJLX1JQTV9BTExPV0VEIHwKKwkJCUhDSV9RVUlSS19SUE1f
SUJJX0FMTE9XRUQgfAorCQkJSENJX1FVSVJLX1JQTV9QQVJFTlRfTUFOQUdFRCB8CisJCQlIQ0lf
UVVJUktfRE1BX0FCT1JUX1JFUVVJUkVTX1BJT19SRVNFVCB8CisJCQlIQ0lfUVVJUktfRE1BX1JF
UVVJUkVTX0hDX0FCT1JULAorCX0sCiAJeyAvKiBzZW50aW5lbCAqLyB9CiB9OwogTU9EVUxFX0RF
VklDRV9UQUJMRShwbGF0Zm9ybSwgaTNjX2hjaV9kcml2ZXJfaWRzKTsKCmJhc2UtY29tbWl0OiA4
ZDZkYmJiZTNiYTYyZGUwYTYzZTk2MmVlMDA0YWZiODQ4YzhlM2FjCi0tIAoyLjQ3LjMKCgotLSAK
bGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
