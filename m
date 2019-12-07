Return-Path: <SRS0=ySRA=Z7=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B74C43603
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Dec 2019 14:21:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9799C20726
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Dec 2019 14:21:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WuINQ2jM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m23WEjs0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9799C20726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YD70a19RM/YnslONF7hZnSyWOAUfo1UaR74ngOnyQ60=; b=WuINQ2jMMUmtbM
	LE8gtBYIosiklNl4iYVoLENv7mOf1xkxZv/OolUCWNfjQz0zcnggu/Bx1Hp8Lw3uPIAjjIN7BZ7nf
	C+lBRaJQJXLOzpMV6m7M3RfgIqBXuByzqqINPH8pVKxWFYwoJT+5XjsVVN2VWE6aHZNxQf5WQea5N
	x4tB9uFnKIWxCplqffZGjvpO+LqveScXmlV+Km29qcLC+0FRHrimz9VFhWL6g4E/V2GcnTK+mRHDu
	8LIEl2azwcDvZslpjN7ZzPFL8GxpVRcq3N8AeY6P0p4oFOqn022E50e98KTapjURC+pKh3hXHujhq
	2ciuE0encpck9xKBCYeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieJul-0003Y7-Eg; Mon, 09 Dec 2019 14:21:31 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idenZ-0001tQ-3L
 for linux-i3c@lists.infradead.org; Sat, 07 Dec 2019 18:27:22 +0000
Received: by mail-wr1-x443.google.com with SMTP id t2so11451400wrr.1
 for <linux-i3c@lists.infradead.org>; Sat, 07 Dec 2019 10:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aa6l8+iIij3OJFvZOZzXN4zGANQjDpNH8fStlTqEIWk=;
 b=m23WEjs0SI70EvQEPOu18sGGkvPE9oMetHFPvr71mG0HhwqWWg1Xm9y1GXtEVzJNJd
 BHf5MPhhohaz4IHbrClTTK8LdIUevdwQbQC2OSweI+AOYmh/myE05PoWRN4RSjhqkBym
 ixH1aJAQIsErfRPSCTvb42XQDtaokqcHJ0lYreCWdpEGZpYjCpvWDf6eMXGxCluS23zX
 DFJnIZpad5T/sgRBlaMtTPT2gzaF2J0ohz6fFpSjhAKh7MDIpX5flD3r0mWvlmCwYPtK
 siblTOSWp/FcbvzSvOGSKdiXV6e+eMDm4dhUqUhod6aNvpR7H894BjB5rNf2qhqKQpk2
 FgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aa6l8+iIij3OJFvZOZzXN4zGANQjDpNH8fStlTqEIWk=;
 b=YasWBkFLcwwpyxuUE9tXutgr0zzweW7T9atDTMBmI+L/XzuFrD2hDSZm2oKy585KtF
 ixAaehmrs90QgZXw+sh0KYGv7rY/hlZg2tb46NpZAJJtPkaSbH3pDNezhTUNkHuXQILm
 U4G4aNe3fy+iZzQN3dTsf2/Mr2LPUlfpOoIaaHSGbXYbOHGt/1ah5L0uoFlUN6F1Ozxk
 ag7r/8AopX1ew0HkVlkWQxSBQEU6zhRiNckSbhxW7Wth8FTqX+VO2rSxQA19jG7KlJG9
 h+QTsM+HF1xXS3woi/6qnEgbpbVMpu181k0jBH+WBMG47dYBQks/zNEeeSlygi9KFKAW
 yeiQ==
X-Gm-Message-State: APjAAAWVxPzjsJiiND6fMLllcovXbMZQsEt7BOL7OEhRNBBP+fAXSDmc
 usFTSqYnWWY9Pg6qyN8sXKI=
X-Google-Smtp-Source: APXvYqwICamRNwt4rbMxw0f4GqN/RQjHGDcbcmSc52vaTC1Hr+sao7Nrm8Lq4bV60Q8319T2gQzRLA==
X-Received: by 2002:adf:e6c6:: with SMTP id y6mr22131117wrm.284.1575743234887; 
 Sat, 07 Dec 2019 10:27:14 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2d4f:f100:30e3:988a:bff1:5a99])
 by smtp.gmail.com with ESMTPSA id a127sm7916125wmh.43.2019.12.07.10.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 10:27:14 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Przemyslaw Gaj <pgaj@cadence.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH] MAINTAINERS: fix style in CADENCE I3C MASTER IP entry
Date: Sat,  7 Dec 2019 19:27:03 +0100
Message-Id: <20191207182703.14102-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191207_102721_168382_69CADBA2 
X-CRM114-Status: UNSURE (   6.84  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 09 Dec 2019 06:21:30 -0800
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: rafalc@cadence.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, vitor.soares@synopsys.com,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-i3c@lists.infradead.org,
 agolec@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Q29tbWl0IGFlMjRmMmI2ZjgyOCAoIk1BSU5UQUlORVJTOiBhZGQgbXlzZWxmIGFzIG1haW50YWlu
ZXIgb2YgQ2FkZW5jZSBJM0MKbWFzdGVyIGNvbnRyb2xsZXIgZHJpdmVyIikgc2xpcHMgaW4gc29t
ZSBmb3JtYXR0aW5nIHdpdGggc3BhY2VzIGluc3RlYWQgb2YKdGFicywgd2hpY2ggLi9zY3JpcHRz
L2NoZWNrcGF0Y2gucGwgLWYgTUFJTlRBSU5FUlMgY29tcGxhaW5zIGFib3V0OgoKICAjNzgzODog
RklMRTogTUFJTlRBSU5FUlM6NzgzODoKICBNOiAgICAgIFByemVteXPFgmF3IEdhaiA8cGdhakBj
YWRlbmNlLmNvbT4KCiAgV0FSTklORzogTUFJTlRBSU5FUlMgZW50cmllcyB1c2Ugb25lIHRhYiBh
ZnRlciBUWVBFOgogICM3ODM5OiBGSUxFOiBNQUlOVEFJTkVSUzo3ODM5OgogIFM6ICAgICAgTWFp
bnRhaW5lZAoKICBXQVJOSU5HOiBNQUlOVEFJTkVSUyBlbnRyaWVzIHVzZSBvbmUgdGFiIGFmdGVy
IFRZUEU6CiAgIzc4NDA6IEZJTEU6IE1BSU5UQUlORVJTOjc4NDA6CiAgRjogICAgICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL2NkbnMsaTNjLW1hc3Rlci50eHQKCiAgV0FS
TklORzogTUFJTlRBSU5FUlMgZW50cmllcyB1c2Ugb25lIHRhYiBhZnRlciBUWVBFOgogICM3ODQx
OiBGSUxFOiBNQUlOVEFJTkVSUzo3ODQxOgogIEY6ICAgICAgZHJpdmVycy9pM2MvbWFzdGVyL2kz
Yy1tYXN0ZXItY2Rucy5jCgpGaXhlczogYWUyNGYyYjZmODI4ICgiTUFJTlRBSU5FUlM6IGFkZCBt
eXNlbGYgYXMgbWFpbnRhaW5lciBvZiBDYWRlbmNlIEkzQyBtYXN0ZXIgY29udHJvbGxlciBkcml2
ZXIiKQpTaWduZWQtb2ZmLWJ5OiBMdWthcyBCdWx3YWhuIDxsdWthcy5idWx3YWhuQGdtYWlsLmNv
bT4KLS0tCmFwcGxpZXMgY2xlYW5seSBvbiBjdXJyZW50IG1hc3RlciAoZWVhMmQ1ZGEyOWUzKSBh
bmQgbmV4dC0yMDE5MTIwNwoKIE1BSU5UQUlORVJTIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9NQUlOVEFJ
TkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDBmZDgyZTY3NGNmNC4uNTlkNGNiN2IyOTgxIDEwMDY0
NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtNzgzNSwxMCArNzgzNSwx
MCBAQCBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL3NucHMsZHctaTNj
LW1hc3Rlci50eHQKIEY6CWRyaXZlcnMvaTNjL21hc3Rlci9kdyoKIAogSTNDIERSSVZFUiBGT1Ig
Q0FERU5DRSBJM0MgTUFTVEVSIElQCi1NOiAgICAgIFByemVteXPFgmF3IEdhaiA8cGdhakBjYWRl
bmNlLmNvbT4KLVM6ICAgICAgTWFpbnRhaW5lZAotRjogICAgICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaTNjL2NkbnMsaTNjLW1hc3Rlci50eHQKLUY6ICAgICAgZHJpdmVycy9p
M2MvbWFzdGVyL2kzYy1tYXN0ZXItY2Rucy5jCitNOglQcnplbXlzxYJhdyBHYWogPHBnYWpAY2Fk
ZW5jZS5jb20+CitTOglNYWludGFpbmVkCitGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaTNjL2NkbnMsaTNjLW1hc3Rlci50eHQKK0Y6CWRyaXZlcnMvaTNjL21hc3Rlci9pM2Mt
bWFzdGVyLWNkbnMuYwogCiBJQTY0IChJdGFuaXVtKSBQTEFURk9STQogTToJVG9ueSBMdWNrIDx0
b255Lmx1Y2tAaW50ZWwuY29tPgotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWkzYwo=
