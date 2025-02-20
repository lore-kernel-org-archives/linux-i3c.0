Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6389EC021AD
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2025 06:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zwYX25NTxe2bFQ6lvtZG7rSWhlXwvwHi4xLPR/lCzNY=; b=qN7oPYN6SCMwMa
	vo95ICloVDf0rBSFeoATc3ePTeXS5iscynCbq77t2/HpGrsIWDLwimmvfYQI7ryzUr6ShvCQdpAXh
	xmI7CXIU0Dqw0ScA8edwS/ugvOVqLcnPwd7nbRAlap9MnUmAhvdrMzeEMU4HwbtS+qeI/xy4YM1P2
	sqIQlx87T3+zwOsY4YXKPHeBrrG4c4lP2ZqqsWq/7r8aCKHBRAhAMBxPZ08DC3XCra83S1Ojb8FYq
	UEIjuH+eiZJSvInvHasF2lrdRPKafUu+H1h0FbvTw8bgeZVdJcAQzo+Tef/l/aD1rUhTqWy/gwQAT
	rqLN3Ma6hDocKTu6dLmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkznd-0000000Gtjp-0PIS;
	Thu, 20 Feb 2025 06:12:41 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkzmD-0000000GtLM-3QmQ
	for linux-i3c@lists.infradead.org;
	Thu, 20 Feb 2025 06:11:15 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-220c665ef4cso7586775ad.3
        for <linux-i3c@lists.infradead.org>; Wed, 19 Feb 2025 22:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740031873; x=1740636673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xgZldDq/yO5VWimSLneZAx8qBmg/WC4f9EIjy2qwa9M=;
        b=cbiW4TibT1wqnkVwibVuZdG9Lpsmx2fa//ilewqd3Ygjjo936QjjtNU+6zk4c34i+H
         Igxva5mJa8vzDApIUyucHGo9Fm4PTaSxuwjUIR2ZJGlzaaL5/llR8CVKiirRneZYPIV+
         DjqTf5DZiw+XSP/rfPd4lSK5HGVyUpz9aFmAiTvGC5LPVXW2oNxcTlCyFlGTDAOLAsZJ
         QWFZAKRjmNOuzICckU2xCZEEVam49p0woZJbnvwhUdM7opIvngm1f4pp1RSABDI92eiq
         zol92dCY5AgKVItOUtZDZRqC+bXp6rb8dCGTeR45EAdatLpUjd3lQcvkAPkpfxYw8U9t
         thjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740031873; x=1740636673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xgZldDq/yO5VWimSLneZAx8qBmg/WC4f9EIjy2qwa9M=;
        b=AfMk97TO0YSnwDvL62dt0tJ7CLLE/OKGyvDp+vnX5+172wcOPr1/Tz2nYaneSwBsis
         BDd3U0Lk3Mdj6P5YNFn4l2egfuFBB1gLBnhPX9YAjjc/V6Bl9c+gF3EOOGdX8DtUX+IJ
         qaY7NCt3rwOH6HYmiOFrRwbGAg/rKB8T1C67aZtqzKica703zOK8dWwmueGjdu52opdg
         QxKRLHBZmYiBJlaZXnv9qw3Aga2VMA7G/6JcclZ2d0vULmEu10a/9Moi19I31DX7TfsS
         a5xNHcczaWcf9n5v9dhQiX3kyQGSC1Yt41cTwpjihuY/xbn/yLOn+2ZmEZ4eGYvygZq9
         0jiA==
X-Forwarded-Encrypted: i=1; AJvYcCXKD17oS7Er0/jMaUhR+E91AFXe6+eJQO25j7mCoenqzXo+5U9zIy0lLJNkppz0a10F+YNIRqRQMMg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwT0J5jzU8jBx+oD8zMd2apQDPNe5uHxky4v0niPjHeZfAqruS7
	YSUb+yQgbF18QZmg8UDLdE9Hs9ufbjNX5hVSAyFAUPNCfGjk+lUQ7k/J6w==
X-Gm-Gg: ASbGnctmsDnlIZsGY5mEsKnwalbYWqAKn+Vrd8cEau2oW2YWaHlvbLBBV/FEw5aOcYG
	nlw1ebiKHEw7RkVY7LZtlAkdEWOUDsPGTgCVxDrPP78m4vP3iyIJ+f8/xipsosegEr2vGF7NGuJ
	s9lQ7Vzh8NLsLhMuasVblwnoRG/uFt5svFLKpCwBr7y+/c49LepDXwEWIcvi1eevlc3p9gKDOA3
	nVhCuQrYdDeAEik432DKvcnhJLC4YFBe05yjS5b8W7ezWN/HokEEEXRQ+BpopHNCjluxKih0xqR
	0QLHojsZVA28zQZ4+ZTMTqkOoA==
X-Google-Smtp-Source: AGHT+IGMKCnN108R2DoHpoWY5glP/ASNjPMMLynLcJzPcLDqzL438UYtbPahDYUPbY2rfSfR/ZgzpQ==
X-Received: by 2002:a05:6a20:d497:b0:1ee:c093:e237 with SMTP id adf61e73a8af0-1eee5c58d62mr2325033637.12.1740031872911;
        Wed, 19 Feb 2025 22:11:12 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:dc0a:4fe5:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73271a02648sm8226823b3a.107.2025.02.19.22.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 22:11:12 -0800 (PST)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH RESEND v2 0/4] Add support for Nuvoton npcm845 i3c controller
Date: Thu, 20 Feb 2025 14:11:03 +0800
Message-Id: <20250220061107.1718239-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_221113_872591_DCE12F6E 
X-CRM114-Status: GOOD (  10.13  )
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

---
v2:
 - Add a new compatible string in dt-binding doc.
 - Add driver data for npcm845 to address the quirks.
 - Modify svc_i3c_master_write to be reused by SVC_I3C_QUIRK_FIFO_EMPTY fix.
 - Fix typo of SVC_I3C_QUIRK_FALSE_SLVSTART fix.
 - Remove the code changes in svc_i3c_master_do_daa_locked, will add it in
   another patch series for common improvement.
---

Stanley Chu (4):
  dt-bindings: i3c: silvaco: Add npcm845 compatible string
  i3c: master: svc: Add support for Nuvoton npcm845 i3c
  i3c: master: svc: Fix npcm845 FIFO empty issue
  i3c: master: svc: Fix npcm845 invalid slvstart event

 .../bindings/i3c/silvaco,i3c-master.yaml      |  4 +-
 drivers/i3c/master/svc-i3c-master.c           | 57 +++++++++++++++++--
 2 files changed, 56 insertions(+), 5 deletions(-)

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
