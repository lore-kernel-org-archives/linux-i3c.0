Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983B8C54EFC
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 09:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jD3z7mr1AKnmCKuk1D3sOOkLRxVjA4L1TaT9tALks6w=; b=yTnCrSJ12nAqWu
	D9YcBWlrbIwzUmU/fbbexH/mNquhyH9+tTmMj9O1sqfKo074/pD11tPYkEUljfem8kMMgYqjZpEgv
	uVqbMZRghKBDi1WofVDSaB9cgTlxo63k9tzRQS7zpRmUa1FGlNeWbXczvq07qK3360Jdfj06k/s55
	MMPEI0Xm1BGwv8YHZznM3Vxari/ULV5JWj9Z7k7noZEc8+EtopH9dmAsne3C6u55AmYt4Jh4qRufK
	x63nCymMaJcJQ2AyVpClyKbvgA+gZTbwvLRgbl3zbYDeGQSl+h1sTIB7Wfo5PTPCWnkq0GZ0o37qO
	A10hC86XITEZzeq2Xk+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeBK-00000004pyu-1KTV;
	Tue, 28 Jul 2026 09:33:02 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeBG-00000004pxg-3wVb
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 09:33:00 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2714258a91.2
        for <linux-i3c@lists.infradead.org>; Tue, 28 Jul 2026 02:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785231178; x=1785835978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YdUiqClYy+lUCnVC+2eitpCVhEPEfM4UIkHz4xO6XCA=;
        b=l54i408b/44TZKF34O6Z1rCPJaDvSPAD4EbBhy1gA6HqS66tD9HqMDNtYmP2XUbIov
         WY7kM6a6d/H3wJT5K2mLz+rjEGWHejj4QWwuz3rURQcelNb0wFzRksAc/f37I83zLnBY
         YvpRqZZ6e2IdaLgK0sxLYU7hgngCM+p9w4g2qWDY7caIb7N84MNBxtM1Cc1Qz0eSMB2t
         yLKurmsXsF0QzNZq8LZIAJZtW4E0rRsbtd8ksKT3q/pQcIheP1rGwWooNjy/pGwTqojZ
         QQu81VhwP5tDzTUnajeYt2YYKpLnznHlewdGQheJOK2F505R/9UMVrcpiaCJSbG6DaVT
         bX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231178; x=1785835978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YdUiqClYy+lUCnVC+2eitpCVhEPEfM4UIkHz4xO6XCA=;
        b=MUrGT8nbXYKpUWhkztD1zV1j8J6+S0dxB/rYa4h7sAiOfWgmpB3Z0CNgv41w5S6PeT
         o2GqA9vRJyEPt/uPvDq7YHXjEq5fKeGRehhUkjWZeH8SyOkkCYSRZuljp+nWbgLUk5h+
         tb9CN2g2l+D3QSPdAO7yEGznGBFZItrb6y4oNkTRTEozkXlaG+T6t6gv6+lGrL/P8+tf
         7pUN/rlFk05X2c+se5ALeJCXSvWwX0mrnpqOIy5crddqZjjTGXYiL+X2F9fCE7jnXRTO
         mwaGSVSC3fC//ybK3qzUVWZf0b/tRWqOY/UiKtN0yClKlUSEZcSIRL9nVIvcucf2H7XG
         c/bQ==
X-Forwarded-Encrypted: i=1; AHgh+RqI2KLjfiVwkS7YsPEqRK6W4ruPjBr7DlkAu+A+iC5TOFmV9zsusfPFRQqmimMvZejjZb14TZkTnzU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyKnvarpunLd0p7wrofF3M+W4ZuH9CXt0hISSMjLtApE2VPd8yY
	FkNzeJy4u6Fq6dPZM96FcVbISjIn1ruULT/gcLX0g3SNMvMbzoQhC46X
X-Gm-Gg: AR+sD13P0l703/5/K220SsdMSBbPhSs8jGVUNLOOcRlYZ1y6qGDKlhczLePLEmcct4X
	sN5+8yINf9Q3GENf6Xqw27mKiiJH5I6f8cFcGTcpGVNjjxa13SbFE+uIhfm75dTxp81NvOnXWiO
	noBr+TxLCXDeexkxvBRzYGPi7+yGZlblLKPbDUPRqTWXv3MjJqvvG2Btb6gOdvuFKFFYhYxVaZq
	eDBXVPKTuRgfX28kLDr7ZErnZU/sSVtSQ/wIvTUJr6HVXh848HWEup/hQ76kQuq9nHndsGW6HwO
	2ubrFBqaEZKR1PIcoiLpgWIdvTl+8PAFihTrMVlnTKGdCxpbsfIGWzucew5hLzeQz9YgRnpoMcN
	cOmGGojk5XDuwYRXywOcKwSmLllqUHQLvolu5wH+VZpvgIQ+OkthclOK0/62s9Hj7fnjlp8e+3n
	noP1eJIjtBIwCzr8qa8MS0DPXMk4DNFSlfKXujFx78WfPvCFu7DQjiH5yuazGzmjwwS1f4CpgHP
	kvCT86UImDhlZRVfdKM9KsAT2knoyX8wuA=
X-Received: by 2002:a17:90a:dfc4:b0:38e:485c:ebd3 with SMTP id 98e67ed59e1d1-38f6a303647mr1788498a91.15.1785231177751;
        Tue, 28 Jul 2026 02:32:57 -0700 (PDT)
Received: from jm-Lunar-Lake-Client-Platform.. (2001-b400-e14e-87ac-83f9-7a00-1613-f224.emome-ip6.hinet.net. [2001:b400:e14e:87ac:83f9:7a00:1613:f224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089e3472sm4592446a91.3.2026.07.28.02.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:32:57 -0700 (PDT)
From: Jian-Ming Liao <tim678910@gmail.com>
X-Google-Original-From: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	adrian.hunter@intel.com,
	jarkko.nikula@linux.intel.com,
	linux-i3c@lists.infradead.org,
	Jm_Liao@asmedia.com.tw,
	Chloe_Chen@asmedia.com.tw,
	Yd_Tseng@asmedia.com.tw,
	Patrick_Yen@asmedia.com.tw
Subject: [PATCH v2 0/3] i3c: mipi-i3c-hci: Add support for AMD_PT and improve IBI/PIO robustness
Date: Tue, 28 Jul 2026 17:32:35 +0800
Message-ID: <20260728093239.487156-1-Jm_Liao@asmedia.com.tw>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709071744.333403-1-Jm_Liao@asmedia.com.tw>
References: <20260709071744.333403-1-Jm_Liao@asmedia.com.tw>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_023258_980299_59B820AF 
X-CRM114-Status: GOOD (  11.07  )
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

This patch series introduces support for the AMD_PT I3C controller and
includes several improvements to the MIPI I3C HCI driver to enhance
stability and compliance with the latest specifications.

Summary of changes:
- Patch 1: Enables IBI threshold interrupts by default in PIO mode to
  better handle early IBIs.
- Patch 2: Adds explicit PIO queue management (enablement, starting, and
  stop/restart logic) for compliance with HCI v1.2.
- Patch 3: Adds the device ID and platform support for the AMD_PT I3C
  controller.

Changes in v2:
- Patch 1: Removed unverified "Hot-Join" wording from comments and
  commit message.
- Patch 2: Addressed maintainer feedback:
  - Removed '-' prefixes from commit message.
  - Reverted unnecessary debug line movements and cleaned up 
    macro alignments.
  - Removed redundant manual kfree(pio) to prevent double-free issues.
  - Adopted a helper macro for HCI version checks instead of hardcoding.

Testing:
These changes have been validated on the Intel Panther Lake (PTL) and
AMD_PT platforms. No regressions were observed for existing controllers.

Jian-Ming Liao (3):
  i3c: mipi-i3c-hci: Enable IBI threshold interrupt by default in PIO
    mode
  i3c: mipi-i3c-hci: Add PIO queue management support for HCI v1.2
  i3c: mipi-i3c-hci: Add support for AMD_PT I3C controller

 drivers/i3c/master/mipi-i3c-hci/core.c        |  4 +
 drivers/i3c/master/mipi-i3c-hci/hci.h         |  5 ++
 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    |  9 +++
 drivers/i3c/master/mipi-i3c-hci/pio.c         | 76 +++++++++++++++++--
 4 files changed, 88 insertions(+), 6 deletions(-)

-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
