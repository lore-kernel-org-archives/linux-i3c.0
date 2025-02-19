Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CA3C021AA
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2025 01:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rIOZA15lmbPWNEa+orWOZz+VjNcvL5+9w0fuJ52iNdU=; b=tqj0KRjmhh+gD0
	ebpix3f2PJczY88pGBplKFn27g6XSnOqDcH1RpwnSambDp+mW8doau9ryKtS1wi0Q3ZXw5vCt3RwL
	C3voO8Ow/fOEgG3KRKLVP4BO3LArVFyEAAPNn3v2rmmZ3+PebgXV9nkm0xi7x8omIxlcudpMR6AeG
	c4OIqbxrXdukNrTn1/ppmsQajPtqUbcWrJQ7rnCcBCLgCmQCSI70jiFGD3hjERyLh1oh/i7RJCVSo
	tamDVOGHSoHUnPVqhnL0/iRtzx0fkcdLfebiKHhai+Ck+PIH5SVQaE5XuE/HMbspxCX/yNrvvDkZF
	VYKWEHoCTpvTKedsbiEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYcW-0000000AUjo-09oe;
	Wed, 19 Feb 2025 01:11:24 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYba-0000000AUSZ-3Qa1
	for linux-i3c@lists.infradead.org;
	Wed, 19 Feb 2025 01:10:28 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2fc1f410186so582837a91.0
        for <linux-i3c@lists.infradead.org>; Tue, 18 Feb 2025 17:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739927425; x=1740532225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tPP20hMwm4e/s0jmdLYDurh81murirTr7TGKiykzS3c=;
        b=IQEhL9PaL5rqiHU9XFb7G7fKvZ7LWsza4fKMc3HJ+CYTCLbOmkpZtga0iDk1h92Sn8
         DkIVXKxIDf+pLI60c5WYPs8UerOFt0p73FqDsAaCYmuwSAsFPN6qvR3jOOrt/CzvAXXV
         ywk+0k7JpoHF3tb/wtynXmQTAd8wEvHjEgljYhFvY+wzfanrg2MiCjJNjr1ZFS8RID0u
         2TbSEcIsFgvvaj+ScI//1G7B5GgxwzITMTD61K1V9aqTeozunawrogPKn+BEO5OBodT/
         qJlxNuet11Wsr9C9qDOZXQRDI/1p8axQbKQL1sAEGuHcrXuKM9yYHy4O1AhzBFjjoAWh
         Ky7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739927425; x=1740532225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPP20hMwm4e/s0jmdLYDurh81murirTr7TGKiykzS3c=;
        b=We7Fu30MkHxKH+j3ui4PnZXTpaxP0on4bkcrgAnRhXSg2PnEko+NufjJKTyyl3ffkO
         Hu5RQXgdmbRLL8v8wUFSXaRlB950PEE88u+Cy/6iWr9ZBTuK/jCA701AGvvoiypA43gm
         RYljUZ/CCmcITkrKsYIT5iISkxfbB+pHXwKNHbI+r1lz7Pgnpu8wzkHDNWD5QcQZOswC
         Rw8co3szyfdVFLOxd+G7Re+45EKqq+mDXWmHvcnSKXluzYblIQdrFIUepyTwnxNf38Kv
         ZdBlvhFO8VGc1GIETlpN4ix7jJfkmJb53b/+PiJiQ1en2UEJZVtQp9u1OX95sHYH+9SM
         aO0w==
X-Forwarded-Encrypted: i=1; AJvYcCX7kbirXeWXYFCGr01D3PqZj/HweEQoavVK2DXAyH8D/ylJw7gxfSuz+eAq+0N/hbXPjoI3wxGDqWc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmPhPvYqXk/822H7W4Kc4Y0xWW99LZULyTIJQ/6AK7/FXu+IUO
	n8ohOywhjRdmwLMhaZ9vOqhJuOsH7Feh1CJi5APB2RirMw3F7JT/
X-Gm-Gg: ASbGncuMLFqUvvXvn6gTtBh1+xkwhkQE3qL7th+qGgh0Cp9VX9EzCpG+wDQ5xaM3jUc
	QvUZK8aVDbiobALcNZvuNi4i4vRqnXF9774bLDRSE0RJPXTKMv4KsWO8MAIFg4iVip3V5xHM8D/
	qauwqPnb0EnlXO4AM7JAgPkYzy3hO018KXMzNrEmnyFm5TOUhq9UBmHxPn533EkoUdxPFULmFH2
	G7lSKG0ZEnHVVlc/k8B/XBlY3qCVpkcSYINoeOyRb+JLpGDsWC96euxvh37lcgcU4nAUWkEINzN
	pfOIQWNtuUGntlVeFDGv6pOj8A==
X-Google-Smtp-Source: AGHT+IGGAt2uTHnIMgc2ojQC/dDaRgH+URJZl2YMeEP5q6CurdFXtqWho9IXnGnQuu1RmgUQoOI9tw==
X-Received: by 2002:a17:90b:388f:b0:2fa:42f3:e3e4 with SMTP id 98e67ed59e1d1-2fcb4cdad5emr2927596a91.3.1739927425616;
        Tue, 18 Feb 2025 17:10:25 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:dc0a:4fe5:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5348f05sm96080315ad.2.2025.02.18.17.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 17:10:25 -0800 (PST)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v1 0/3] Add support for Nuvoton npcm845 i3c controller
Date: Wed, 19 Feb 2025 09:10:16 +0800
Message-Id: <20250219011019.1600058-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_171026_852434_F37F17B2 
X-CRM114-Status: UNSURE (   6.90  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patchset adds support for the Nuvoton npcm845
Board Management controller (BMC) SoC family.

The Nuvoton npcm845 uses the same Silvico IP but an older version.
This patchset adds fixes for the npcm845 specific hardware issues.

Stanley Chu (3):
  i3c: master: svc: add support for Nuvoton npcm845 i3c
  i3c: master: svc: fix npcm845 FIFO empty issue
  i3c: master: svc: fix npcm845 invalid slvstart event

 drivers/i3c/master/svc-i3c-master.c | 72 +++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 9 deletions(-)

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
