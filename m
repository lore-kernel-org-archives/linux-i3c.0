Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6864C19F38
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Feb 2025 06:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t9jr/G06q2PXUQ4ewUu0kgXCWbu8wh2Sl+1B+Zffm5E=; b=u9m4GhngosGfI3
	2YtFuc+Szm+o6lKl5uD0h45jUHNwsnsjMWU0i8TI0RO62bBQ6oYEdEOqouBCp6FYQS9A9K71fKYPs
	Zm4IHpmD1g0qrf04hNtHshVx/1UoItm1vmGrwTc5GASXJgcJnR4o9JFTI6uEWX+qqD4aqwycgxNE3
	yWcsSNnCGsF2aBbW2WIBDNmuL6mbBuYm4IMxinGdihCP4gE7rr9sBewfhU6B02cqOt/CBwaaQVjAx
	JWj7czjUMddxvlBOrnQs3xylA7JGpCJ+keLZt4M1H0fT3wZ/vSMg+Ip/fNsL2JD9H+RP3qdO2JW81
	dFddVZrAW5wovXTTywIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnX0J-00000006RcW-2IAv;
	Thu, 27 Feb 2025 06:04:15 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWxt-00000006R6j-1fTV
	for linux-i3c@lists.infradead.org;
	Thu, 27 Feb 2025 06:01:46 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2feae68f835so39787a91.2
        for <linux-i3c@lists.infradead.org>; Wed, 26 Feb 2025 22:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740636104; x=1741240904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/mQOD6qMSjdqWtzCTx+pFa0M8XN6p/c/XrJV+5EOBBM=;
        b=d2N2LJ/I31d2Ei093gi0NeEqGvoSIqySKqV1dILnPkWQ5wSpHGPCLww6XLEN+Ubmc+
         Fp4LN42NZKm8O4Wmnsd4Tr3jsg7oyPhxgLzvrLOSKRVV3BRM1QenAEm4H3dTqhBaJsYP
         HXzIPNr8fLz/0JCuLIdbmmcm8afTUlZC+aVwk868YpNzeJrUPblQbbTNHPO5CSulJ81j
         Gz1VrWW0dsbTmgYTXqEJ+WR/9DB18Ks9btd111iC2dumRO2AsTMSX91mbA1WRCQQh+VV
         keHOsYrq3Qnzu1OWDPTqQMdj2PcJynlm+dakFURLWVGzE0XQLVzY0ck0catH/A+XDGCd
         ng/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740636104; x=1741240904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mQOD6qMSjdqWtzCTx+pFa0M8XN6p/c/XrJV+5EOBBM=;
        b=gV7FoEVek97R/91a+BCblMSd5YuFFfmGPnLdkvzGpewMCYWh8X2wGYXGdafa48udIU
         IjASnr2gKE0g8+2Rkj+GLy+7N9gLFHJbZrETvlIp+J6x9mP/lqtt+RCq48r31rHQZJWO
         H5R8wGatLJRJuyR5/Z+envd2Hzj4IhhxAsrrLpkNVF6YW4mh30EDo/Rm2PxFQnTq2jHk
         bGpYkgP5pUOCaWg5lLp32aQteEj4mdxDemTkXtmH+Gv649w2ylzNFYuXK8rjsZfwPs5T
         2DwwQanL2QqkrUy2T5E9oQmPeUSCi/6VkS2CU531pSk6ks8S5nz5fd47vGGVdWhbbMcV
         bGPg==
X-Forwarded-Encrypted: i=1; AJvYcCVXt56vICcJq8pgxRzdPyXS1psT/YhsYA+IlWn9i8qWfsztYMSGIu5yIQIrU7XvRJYeifWSWLbgA44=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx08N9jtAKzBC3sFxWCnfAVYrRCma0iETMUtVZ4zJq6xXB20K10
	Vz83TKwB0GoRyTupH5IHF3zA+Yo2XxUF1bd4RaDfW5xuSGHYMkFY
X-Gm-Gg: ASbGncvoV1ipAHKMMlA/CXoszYUNFE++YmV37Mljoo8OHRsYRIOmi6WfMHs2LNW03CK
	49DCmf0mkxCHze2NVdqxggSqGUV4HRJ/TP37+4J7s3UKe0yyg3kgfjFHjXs7lPtPLm3/oR/Lamd
	rYnj5M9KboX7vkcXIHXtZIojj97UHsjqJvypx3Mgp3s2MJzXRLhxw9X7T9rrKrKs5JrdtKyLn+n
	1wS7E4bha8VOPhntZJQAJ3sRzaThsKaZRUn26Op/ajIyYadYk4RKIT0RLhUUQawqUkgYVKpjs7h
	R6C6oZzDDoVGa7YfR87kqqlLaht4sjDH5W1E
X-Google-Smtp-Source: AGHT+IFuEs4AAjjifzVRpqGnWLY52CMxLXiU8hn4T+n1HgSLdz6Z6rVMv5YZ5DGLwtmkw/hJmQTEUA==
X-Received: by 2002:a17:90b:2588:b0:2fa:20f4:d277 with SMTP id 98e67ed59e1d1-2fce873af65mr39994730a91.24.1740636104120;
        Wed, 26 Feb 2025 22:01:44 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:cd02:bc36:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe824b67a1sm2728177a91.0.2025.02.26.22.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 22:01:43 -0800 (PST)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v5 0/5] Add support for Nuvoton npcm845 i3c controller
Date: Thu, 27 Feb 2025 14:01:26 +0800
Message-Id: <20250227060131.2206860-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_220145_434455_9DF710C2 
X-CRM114-Status: GOOD (  10.77  )
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

--
v5:
 - Add default driver data
 - Add helper function svc_has_daa_corrupt()
 - Revise SVC_I3C_QUIRK_FIFO_EMPTY fix and add comments

v4:
 - Fix kernel test robot build warning.
 - Add SVC_I3C_QUIRK_DAA_CORRUPT fix

v3:
 - Add more description in dt-binging commit message
 - Add the svc_i3c_drvdata structure in struct svc_i3c_master
 - Improve the do_daa

v2:
 - Add a new compatible string in dt-binding doc.
 - Add driver data for npcm845 to address the quirks.
 - Modify svc_i3c_master_write to be reused by SVC_I3C_QUIRK_FIFO_EMPTY fix
 - Fix typo of SVC_I3C_QUIRK_FALSE_SLVSTART fix.
 - Remove the code changes in svc_i3c_master_do_daa_locked, will add it in
   another patch series for common improvement.
---

Stanley Chu (5):
  dt-bindings: i3c: silvaco: Add npcm845 compatible string
  i3c: master: svc: Add support for Nuvoton npcm845 i3c
  i3c: master: svc: Fix npcm845 FIFO empty issue
  i3c: master: svc: Fix npcm845 invalid slvstart event
  i3c: master: svc: Fix npcm845 DAA process corruption

 .../bindings/i3c/silvaco,i3c-master.yaml      |   4 +-
 drivers/i3c/master/svc-i3c-master.c           | 123 ++++++++++++++++--
 2 files changed, 116 insertions(+), 11 deletions(-)

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
