Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C04FF885A
	for <linux-i3c@archiver.kernel.org>; Mon,  4 May 2026 14:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vlaX4wHXpqwBA2YDtdJtQ+XPCd+6fAN3z+sv7xdYgzM=; b=xqBvzyo4rKMFrO
	BBNJe03O/mIkv6OwRjv09ltpmdxeMwohMLZ3LnOQllhND8JWGHv7hODJ+WWSPJ6sOh5w5lc0HFM9B
	t39dKvEqF3AqOay4m0MSkxxGhqL4WyOKFtcUb8btwnEIB9rt7ATVebhA4pnLrEIVuZaHmpQmkWade
	5nvOhQDIjdZE13k3jNFj43tYHgrJ8sNpc0joFeFQIdAHbYUYqWgWyrAdBivy9lLIJoj1Go2dj7UOz
	xYZ8T7ryP9gS7zMDLThG5ao3R1UJGngxQUFNZEnc3D53hoEBtSI7UKtUSxGLDpLWiwHYTGnVpuAAZ
	o8sE2v1Ue/V39BklIdLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuMb-0000000DSpy-1RJu;
	Mon, 04 May 2026 14:33:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuMX-0000000DSp9-2LkZ
	for linux-i3c@lists.infradead.org;
	Mon, 04 May 2026 14:33:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488d2079582so45433225e9.2
        for <linux-i3c@lists.infradead.org>; Mon, 04 May 2026 07:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777905211; x=1778510011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rq5VMlWUp2Vy7zgExgZolthYk9myyCpJYSls89tCW2g=;
        b=UdI5D8NO3ApOmhC7ab9WBEEd9Qp8PXWViu2f4IDt2AHaF3dc2/aSdmLZ9X3zN2MJ4z
         vXqJpzPobC4uRnrtSTjBFs+9JpbBsuIIHHt8I+7zyxY/QOFkTc5+z8dDDypONd5SOlZ5
         0rREYnDB+PHwx4+jVJTSzaWWw6ZvhxhQwseYXjFJT2iPR/dVNiI3A+P1Fkzz2mbd/Dtf
         a0LqpQsXKCIOmdAxrdW7b6bz4zSQ7qN0BI0CWOy7jhDkLrUYQKj8VzsbInsvWtqfGC3s
         Aw/Dbzwr1FhHSshUulsp4Sfi/7akFqokRecmdXoMKk8+skZLrua6eP5dWYVu/GI/e/Lc
         ZHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777905211; x=1778510011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rq5VMlWUp2Vy7zgExgZolthYk9myyCpJYSls89tCW2g=;
        b=eRfuJRu2P7xKGJb+F7DDKbfCdtK2NO9QuSR1RjL2PkhBpkxybQ4U5LLpa9jvzsuu6r
         XhY/ULOcTWyCBmv8Sm0XNgvSCtyevsh04C63i531YSWe8PlaHftPXIqv65/TIGN5feXb
         bw2Y3yQMP/neKKpfpmd/fkgR6Q6n4QpEQ+2FX5u7ZrdF+qexdbasuUcxPwAmC/kmkBK7
         wUId7WUM0GRfcMSAih4fIz6GtTxUW+cJXmq5zyp1u7MFOdoK7qt7/xjkcmkWIKMR8W3l
         KaOwAkWLV2qmZy0nRaRn6ShoLaTLaFJGfbze+brItbO8yBL+XiWkmCPCkaPygcdFSsPG
         xTRA==
X-Forwarded-Encrypted: i=1; AFNElJ9Knb+oJ6jG7PnN4XH+jOPpkTxCNfcWmoXnQAigxVc6JUIL5IqQaB0PEMn/G5JL0y1E0NSY0nHJO4Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWPFEYDlAr0e3f7HZ+esv8/B0nuFZYxX83mBUGkkbRr6o1Hj9A
	szsyhGtyPbs7JQXOePhfZNiF1tu9m2IsI1xavwbnA5PIv5QZYvPf8M0BjlAbNpH2FfPyNhlkIK2
	msbQj
X-Gm-Gg: AeBDietcc0Sp8ONnsvu71QGI6PGYinP8gSo1HhYpF7yL8ZXvP/zq/yw2dWKwHlbF4Fq
	0bVmlurAlLVM/x7HUPYI978JryBEFybJ6jIvpS3Ix3P4o5n8Uq3T/Vvy+XtHbCgiq9uP849cT4n
	0L61xRvTW9AMdbIVVcD2tSi8TtNcy0DIuMvr70TsWEnBOj6qn4HcG1ldp4U6eIcSeAHEqUvFQXZ
	1b9cmtGBxq1NYSgkV4/CIlHz1ZDN/OUZAIG1Dcxq+QSiOBBYazTLx1WWBvP9oeVnF6LxVyLf4/j
	xrQQSczuqnsPN9LFL6JM+EEbbFD1Kmz3c5+0gayfz2tw3Tc3Wun1/pyRUG1dT1B4lb9ykCIUKff
	BBkWTrcEx6v1yPPqfrjXnr4kvctPrx3Z04h7dPIN7hbnntlv5DwdeQh2PdPiiLfXmZ6GBdYMl0B
	q8mMQy9C+ui2gQ4CmN16LNDI2UsA4YU35n6HWi/3GXEyAGi4ftyqOjHjO6r9FpvCeaVfMuN6+TQ
	HHTPnc6m30hlFaQZxmpeiaVFA==
X-Received: by 2002:a05:600c:4e8e:b0:489:6c22:e081 with SMTP id 5b1f17b1804b1-48a980fc4ffmr167408265e9.0.1777905211550;
        Mon, 04 May 2026 07:33:31 -0700 (PDT)
Received: from localhost (p200300f65f114e08197264a4bf9e813f.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:1972:64a4:bf9e:813f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48a8ebc4201sm442193545e9.15.2026.05.04.07.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:33:31 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: Consistently define pci_device_ids using named initializers
Date: Mon,  4 May 2026 16:33:15 +0200
Message-ID: <20260504143324.2122737-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3425; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=oO8KyNjoJNSsmZeeWJ4+k0G0rXSphbl1HtxVrOiH+LA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp+K40aPILHEqBGJvvoIi6HJJgrD/xh/+qGHlOv XjiDS+JemeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCafiuNAAKCRCPgPtYfRL+ Tj9QCACmC4O8BO4Shkhf4R/Ae5118jImTWW586UZFumOBT2KbN1JiIsUd+DQzJXjw4NM3cVB/DS PczA6x5/XU5FBBn3bWlbZuB+k8raYBuX32aGWSw8IJLydhHOQLehDhAMGqVf6KVvIXQ1SQAObzA mZ7+pbEwPIQ7/pMQo0CjwLrFlSGmLae28KjFL1KMNJWjMuZdfhOlkP1027SGBZPaZyLC6LPiek3 mvNxtglYjyVP1axWOF90JRrbCe/3GO0EMQVnQ8V4pUPNBxDZXKivOuQXpBlAwM3AnQ/SOnim/It +SZ9kVSO7+V6Vm+RiIolg/O13ylRsEQ0+c6L7Jv9+42rqKMA
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_073333_670200_729A9D27 
X-CRM114-Status: GOOD (  12.98  )
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

VGhlIC5kcml2ZXJfZGF0YSBtZW1iZXIgb2YgdGhlIHZhcmlvdXMgc3RydWN0IHBjaV9kZXZpY2Vf
aWQgYXJyYXlzIHdlcmUKaW5pdGlhbGl6ZWQgYnkgbGlzdCBleHByZXNzaW9ucy4gVGhpcyBpc24n
dCBlYXNpbHkgcmVhZGFibGUgaWYgeW91J3JlCm5vdCBpbnRvIFBDSS4gVXNpbmcgbmFtZWQgaW5p
dGlhbGl6ZXJzIGlzIG1vcmUgZXhwbGljaXQgYW5kIHRodXMgZWFzaWVyCnRvIHBhcnNlLgoKVGhp
cyBjaGFuZ2UgZG9lc24ndCBpbnRyb2R1Y2UgY2hhbmdlcyB0byB0aGUgY29tcGlsZWQgcGNpX2Rl
dmljZV9pZAphcnJheXMuIFRlc3RlZCBvbiB4ODYgYW5kIGFybTY0LgoKU2lnbmVkLW9mZi1ieTog
VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1YikgPHUua2xlaW5lLWtvZW5pZ0BiYXls
aWJyZS5jb20+Ci0tLQpIZWxsbywKClRoZSBzZWNyZXQgcGxhbiBpcyB0byBtYWtlIHN0cnVjdCBw
Y2lfZGV2aWNlX2lkOjpkcml2ZXJfZGF0YSBhbgphbm9ueW1vdXMgdW5pb24gKHNpbWlsYXIgdG8K
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2NvdmVyLjE3NzY1NzkzMDQuZ2l0LnUua2xlaW5l
LWtvZW5pZ0BiYXlsaWJyZS5jb20vKQphbmQgdGhhdCByZXF1aXJlcyBuYW1lZCBpbml0aWFsaXpl
cnMuIEJ1dCBJTUhPIGl0J3MgYWxzbyBhIG5pY2UgY2xlYW51cApvbiBpdHMgb3duLgoKVGhlIGFu
b255bW91cyB1bmlvbiB3aWxsIGFsbG93IGNoYW5nZXMgbGlrZSB0aGUgZm9sbG93aW5nOgoKLQl7
IFBDSV9WREVWSUNFKElOVEVMLCAweDRkN2MpLCAuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25n
X3QpJmludGVsX21pXzFfaW5mbyB9LAorCXsgUENJX1ZERVZJQ0UoSU5URUwsIDB4NGQ3YyksIC5k
cml2ZXJfZGF0YV9wdHIgPSAmaW50ZWxfbWlfMV9pbmZvIH0sCgoodG9nZXRoZXIgd2l0aCB0aGUg
cmVzcGVjdGl2ZSBjaGFuZ2UgaW4gdGhlIGNvZGUgd2hlbiB0aGUgdmFsdWUgaXMKdXNlZCkuIFRo
aXMgZ2V0cyByaWQgb2YgYSBidW5jaCBvZiBjYXN0cyBhbmQgdGh1cyBzbGlnaHRseSBpbXByb3Zl
cyB0eXBlCnNhZmV0eS4KCkJlc3QgcmVnYXJkcwpVd2UKCiAuLi4vbWFzdGVyL21pcGktaTNjLWhj
aS9taXBpLWkzYy1oY2ktcGNpLmMgICAgfCAyMiArKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9taXBpLWkzYy1oY2ktcGNpLmMgYi9kcml2
ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL21pcGktaTNjLWhjaS1wY2kuYwppbmRleCA5NDY4
Nzg2ZmI4NTMuLjVhOWUyYTQzZWZmOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL21p
cGktaTNjLWhjaS9taXBpLWkzYy1oY2ktcGNpLmMKKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL21p
cGktaTNjLWhjaS9taXBpLWkzYy1oY2ktcGNpLmMKQEAgLTQ2MSwyMSArNDYxLDIxIEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBtaXBpX2kzY19oY2lfcGNpX3BtX29wcyA9IHsKIAog
c3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIG1pcGlfaTNjX2hjaV9wY2lfZGV2aWNl
c1tdID0gewogCS8qIFdpbGRjYXQgTGFrZS1VICovCi0JeyBQQ0lfVkRFVklDRShJTlRFTCwgMHg0
ZDdjKSwgKGtlcm5lbF91bG9uZ190KSZpbnRlbF9taV8xX2luZm99LAotCXsgUENJX1ZERVZJQ0Uo
SU5URUwsIDB4NGQ2ZiksIChrZXJuZWxfdWxvbmdfdCkmaW50ZWxfc2lfMl9pbmZvfSwKKwl7IFBD
SV9WREVWSUNFKElOVEVMLCAweDRkN2MpLCAuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3Qp
JmludGVsX21pXzFfaW5mbyB9LAorCXsgUENJX1ZERVZJQ0UoSU5URUwsIDB4NGQ2ZiksIC5kcml2
ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkmaW50ZWxfc2lfMl9pbmZvIH0sCiAJLyogUGFudGhl
ciBMYWtlLUggKi8KLQl7IFBDSV9WREVWSUNFKElOVEVMLCAweGUzN2MpLCAoa2VybmVsX3Vsb25n
X3QpJmludGVsX21pXzFfaW5mb30sCi0JeyBQQ0lfVkRFVklDRShJTlRFTCwgMHhlMzZmKSwgKGtl
cm5lbF91bG9uZ190KSZpbnRlbF9zaV8yX2luZm99LAorCXsgUENJX1ZERVZJQ0UoSU5URUwsIDB4
ZTM3YyksIC5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkmaW50ZWxfbWlfMV9pbmZvIH0s
CisJeyBQQ0lfVkRFVklDRShJTlRFTCwgMHhlMzZmKSwgLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91
bG9uZ190KSZpbnRlbF9zaV8yX2luZm8gfSwKIAkvKiBQYW50aGVyIExha2UtUCAqLwotCXsgUENJ
X1ZERVZJQ0UoSU5URUwsIDB4ZTQ3YyksIChrZXJuZWxfdWxvbmdfdCkmaW50ZWxfbWlfMV9pbmZv
fSwKLQl7IFBDSV9WREVWSUNFKElOVEVMLCAweGU0NmYpLCAoa2VybmVsX3Vsb25nX3QpJmludGVs
X3NpXzJfaW5mb30sCisJeyBQQ0lfVkRFVklDRShJTlRFTCwgMHhlNDdjKSwgLmRyaXZlcl9kYXRh
ID0gKGtlcm5lbF91bG9uZ190KSZpbnRlbF9taV8xX2luZm8gfSwKKwl7IFBDSV9WREVWSUNFKElO
VEVMLCAweGU0NmYpLCAuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpJmludGVsX3NpXzJf
aW5mbyB9LAogCS8qIE5vdmEgTGFrZS1TICovCi0JeyBQQ0lfVkRFVklDRShJTlRFTCwgMHg2ZTJj
KSwgKGtlcm5lbF91bG9uZ190KSZpbnRlbF9taV8xX2luZm99LAotCXsgUENJX1ZERVZJQ0UoSU5U
RUwsIDB4NmUyZCksIChrZXJuZWxfdWxvbmdfdCkmaW50ZWxfbWlfMl9pbmZvfSwKKwl7IFBDSV9W
REVWSUNFKElOVEVMLCAweDZlMmMpLCAuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpJmlu
dGVsX21pXzFfaW5mbyB9LAorCXsgUENJX1ZERVZJQ0UoSU5URUwsIDB4NmUyZCksIC5kcml2ZXJf
ZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkmaW50ZWxfbWlfMl9pbmZvIH0sCiAJLyogTm92YSBMYWtl
LUggKi8KLQl7IFBDSV9WREVWSUNFKElOVEVMLCAweGQzN2MpLCAoa2VybmVsX3Vsb25nX3QpJmlu
dGVsX21pXzFfaW5mb30sCi0JeyBQQ0lfVkRFVklDRShJTlRFTCwgMHhkMzZmKSwgKGtlcm5lbF91
bG9uZ190KSZpbnRlbF9taV8yX2luZm99LAotCXsgfSwKKwl7IFBDSV9WREVWSUNFKElOVEVMLCAw
eGQzN2MpLCAuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpJmludGVsX21pXzFfaW5mbyB9
LAorCXsgUENJX1ZERVZJQ0UoSU5URUwsIDB4ZDM2ZiksIC5kcml2ZXJfZGF0YSA9IChrZXJuZWxf
dWxvbmdfdCkmaW50ZWxfbWlfMl9pbmZvIH0sCisJeyB9CiB9OwogTU9EVUxFX0RFVklDRV9UQUJM
RShwY2ksIG1pcGlfaTNjX2hjaV9wY2lfZGV2aWNlcyk7CiAKCmJhc2UtY29tbWl0OiAyNTRmNDk2
MzRlZTE2YTczMTE3NGQyYWUzNGJjNTBiZDVmNDVlNzMxCi0tIAoyLjQ3LjMKCgotLSAKbGludXgt
aTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
