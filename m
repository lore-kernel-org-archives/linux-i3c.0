Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78CEC021AD
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Feb 2025 05:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zwYX25NTxe2bFQ6lvtZG7rSWhlXwvwHi4xLPR/lCzNY=; b=gGFTNd1NxWAbHm
	l/fq8vpCRoxvC27Mi1fql7Dox1Ib4HseG2hD6LhqAVPiAD7qrZxEq1xH6fDmS9Bl3lvCr2CDwc24t
	pudAhOj9KlHqw6DRG47u271q0gTnrAI3ePFhvi/KvUa+offn5jxHo3bzdqwAogTuKbaDVp//y4Uy8
	cr/jETNsqlANCyxNMPGVnDDsk7Yk+ZLUE2ieILwebMEliuwrOtRHvL7Cx1hwe2GMH284bgH42awKP
	87p2G8aB4B7AZFp+VnUAIx3zG2+th0Oi+s5l3S8NGleFX30gxk8Pl++d28vaux/PxfVzwXHZbA1FJ
	qD54HejWWajSCNlTxQmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkzLe-0000000Gpsh-2AS2;
	Thu, 20 Feb 2025 05:43:46 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkzLb-0000000Gprt-3tO7
	for linux-i3c@lists.infradead.org;
	Thu, 20 Feb 2025 05:43:45 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-220e83d65e5so8760605ad.1
        for <linux-i3c@lists.infradead.org>; Wed, 19 Feb 2025 21:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740030223; x=1740635023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xgZldDq/yO5VWimSLneZAx8qBmg/WC4f9EIjy2qwa9M=;
        b=NuTrvwHwT2SDiMxDFvJ1FtXytJRGFxMtciLB0wcS8ipXFIVjz00baR4DgTIn5srl5Z
         CrTPkMAJRqO7Tplnsy/gyZcXQfR4reejrL20tvnmoYxtEx/wf9F431ba0xb9Qvsq8bhU
         qJ3fat/hHq1bfDnmR7PHboTIS1m8UHWNze2HmS1RhoQ+rsk77lGP/L6UiQvr/q5+Eodf
         wHyahBptmMh94DgJcfTHcL0c3V5u56VJlk/xGWpOX1/JhWbXNk8chOpnUOzAQunfA4GT
         mJaClGr2EezaFeixxLOsSOH3wD270bvmjtGiKCgQ7Dp5k1pcckv3eCX05r8OxoYMYEyq
         5HkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740030223; x=1740635023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xgZldDq/yO5VWimSLneZAx8qBmg/WC4f9EIjy2qwa9M=;
        b=kfNJWPBm1bScQmyss6poabbiO1jIiFuDVgfdutPTHxkcDCwf1Uh4RyV7av8He0b8zJ
         JiWI8EzxsqbPzUCxu3jRxlo2S3fgcclFMPf2aDdZTHlGEsK+Qo+Ady1Ap8aZm2ohcFYl
         WHjymQS9ibFYzjSIpqFQaRZkgxeTSJvjg02xJGKTMT23Hg6Vy6HjLZ98bOBXmEcc2p6H
         48SZCwfU0bpthe/GWMKoI6lZfkOHfEmfMJc6EFOj6gPbBm5YGzBwnbFUE5Wngx8lBqiM
         /0Q2TKa0nmBDPokC2zTtr7YVPRpmRO/xOuKLMunhfOiTlfsM46YUH+3m4QA2oyOcnFsf
         LINQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBrhXk/2WEtcH2TKpfyzXus12AWtbZVV6yMBY2hU9FEmESaOa6YdOUIlDOLDNijRqtdLcKWlqeOSw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3o7eBRwjgF/QNg4YYQpKekEoHSIi+np+pemxOeL26d0JdEQt2
	iV2IOwJDX6+8nI3hOw25NpB0hYzIiW97LE7CZ5gbA9pHA8WyB9q4
X-Gm-Gg: ASbGnctDbmEFagtkFm8waO5R3vXsJGb4I4+iKf7TRqxW/1UWquGeOWvm8HJvln26RPi
	kAZFxrQuKW1KP5OKCzscAGQJsUoftnM140k7S6GIAVCfFUP8sSUM0p411f6gLSMi3tjZofVN3Ce
	2KMqB0zoZV6uP81VnU4o8GH8KsW4Mp/b8/cz68Rx9+6y994vu9tin8Va/USQ1+atzmhsahm9Yig
	x7tB8h6Yfybq8km52ngWrFdaWTLMYtq792kf5crrnqGZwHU0MTCWqp9Ot7cBHyAr11Zv7n9gqtL
	16YZG9vg57DxaGeTDMGVwPnm9A==
X-Google-Smtp-Source: AGHT+IGOuexKVK1tbntilKykXaiulzDeL4fR6GsXUklJqCXs1Z6nh+tCq7/cp3Zmnlk6wCOHB/ZbHg==
X-Received: by 2002:a17:902:ea0d:b0:220:fae9:8a4 with SMTP id d9443c01a7336-2217055dda9mr81177595ad.6.1740030222489;
        Wed, 19 Feb 2025 21:43:42 -0800 (PST)
Received: from cs20-buildserver.lan ([2403:c300:dc0a:4fe5:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d534951fsm114415335ad.25.2025.02.19.21.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 21:43:42 -0800 (PST)
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
Subject: [PATCH v2 0/4] Add support for Nuvoton npcm845 i3c controller
Date: Thu, 20 Feb 2025 13:43:26 +0800
Message-Id: <20250220054330.1711979-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_214344_020367_7225DEAC 
X-CRM114-Status: GOOD (  10.55  )
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
