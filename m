Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F664C43458
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pJAY49S86qSc98eBhJmDzDQrVlEgZf/rtakPBukAel4=; b=iuQxLEc3jN38sD
	nLMedpiqkrFEey29XEJ14J4bQnVi8E4zZyo0njLgblg3vKJKUEbtmWLbB9b+75OMTZPdN4NJlA/FP
	FepBRnDFIDO6FSLYV9AUZR/aRG2T0uzt+teZj8F+GA3YwtXrP1dXTNJ4qELlUHisYtjFX8krtm73N
	lZlsGq67YABI30kup4P/u+SOubx5taSauhQb0L63nNm3mXxSEXkWtEUFXDKGUaypvgcYwYlqu3BZw
	96pfpnIPOXBv1T5sf26z/7XJ5LCbeLMPO/7UkburOQXf8z4/YS8AfIRADvGXWyLFSk5kgsQzlf0W6
	TYsrYY9/2zSk90mCOBdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGM6-00000009JeJ-0Nyg;
	Mon, 13 Jul 2026 13:05:54 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGM3-00000009JdU-23np
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:05:52 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47f365afc5aso705713f8f.0
        for <linux-i3c@lists.infradead.org>; Mon, 13 Jul 2026 06:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947949; x=1784552749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JqLCAjsIWRR//h7ecqS4cqAoQh9bNc2JNsvLanYeLME=;
        b=rPyCnIbOFmU4FaRgJr9lao+BdLUtaGpPombJccJBm1yLBM+kM0MQ2lCeHcNA6F+T/f
         ha9jw/zIfqNrix10kd/+2Z2uHj74I2yvzn4/vUEKrrxxpQZAyXpKVirBRXGUNHCVIA67
         O5491WC26E27GJiW08N04w5tj7FsbZjP6O6kIb9cIxwOZt0jgv1HKD4cW8vsn1EXNqrv
         a+1JCxMa5dDmx5SkxcBiP7jTk1VcmDzfcnFBuNGAnPQK3sItp9IvQtEkBiiT/D/JJ6zz
         EOUa1Ne0PIhkrISt+1xN4D+vhs52EjEPgZNhvw6NE1DMma406uCuzRZX9NVxNOqXLZz/
         m4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947949; x=1784552749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JqLCAjsIWRR//h7ecqS4cqAoQh9bNc2JNsvLanYeLME=;
        b=S3yHltgl0IlYNb2X2QBWtNk7wpxQSopsWhpEZ2efLI5jDSRg61CQAYe9CQDrXox+vn
         INPl9CkgVqOJ4SAy3Ekxy9qdk/MdRv5TfNhoX3hA2KDzNJtwLLmLLA+4oc6XcMSmDWiT
         Htu2cMC2bSK7EQ/yPyK//ho4IAwBRQ4U1QKXV2sJ1chvbxnHeK8eqgYtP8k4x2IzcGYO
         pxjG6pfePzdtduE3wtNWiXew5Wz4rAJDAXTYhySFu6xyPvuy1KzB6a0H1N+e5sX5FIos
         EEcuzuI0qCN7dLepln6NtQW+S5RXHt4Gqp0/prKZ+FBC2OvAQvzF5vntxFpUfj8oEjY3
         kCnQ==
X-Forwarded-Encrypted: i=1; AHgh+RqmjdrpIi5ZWDiMs1dNquXPp4GOpn3X4TDegfFZrfYJRcekD976cHZIo7rV4pTFeGx3xzdywn/8CCo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwC8LCN30dkVwjATU0nOcIAxln7pOgTeopdVh90HBVm7KysssCr
	iKH+Mr6Ma21RsgruXgpCV+jDznZEE3IQJ6kH10eUzbmIrvlQOvoOmdWkNrMz/Ba32TQ=
X-Gm-Gg: AfdE7cm2EnbNEmi41E2B3m3PMrCaqnpZoyw58PD5GxXuG8lu2/PxL3ChjSu8r1+h6Dq
	WqM+7XX4qBnle9/mB5DrU97cLYTs0c1Qcz6Iz5GApgOsqtLYWxUmVo1FW26J4mQxwVokivnqWdl
	cnfhdzo2p8OYbTMQBurd0ZVJ7cAbrP/9dGtSf1fz8o3NC+kT557vWxShaub6/gSJLViQtVYhV0U
	QaVuLvVRvt17yKXR1kyCc3MwRBJgmNlDi8CT/g9mC/CuC0Du17dI7nFMq5vuKKvYFcQJ0/beY5z
	duq5zB1V/WNu+Qb+A14TRENC+TnC7X7d3Y6PgdyWA7i3zub0irnOkUjaNdDIVyekjirupcEyy/x
	NxIT537R8Kmnw/siVP+nfICCJC4ahGKF0H4LvRH0toh7b4I56eoKAS17Fj9LvkGd3Cj+G04z5oO
	2QQybAfbbCK6uALhN3ct31EbeGm9SjwFbsXLOthy4x0FO5wN+s/vDLiqZpWH5tVB4KZQioWUQ=
X-Received: by 2002:a5d:588b:0:b0:474:4525:eb32 with SMTP id ffacd0b85a97d-47f2dc7d451mr10839033f8f.11.1783947949241;
        Mon, 13 Jul 2026 06:05:49 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:05:48 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 00/17] i3c: renesas: Suspend to RAM with power loss and runtime PM
Date: Mon, 13 Jul 2026 16:05:28 +0300
Message-ID: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060551_651821_B7FFFC12 
X-CRM114-Status: GOOD (  12.34  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

This series adjusts the suspend to RAM code to handle cases where power
to the connected devices is lost during suspend to RAM. The fixes
included in this series are required for that support.

Along with suspend to RAM support, runtime PM support is also added.
Cleanup patches were included to prepare for clean runtime PM support.

Thank you,
Claudiu

Changes in v5:
- in patch 1 introduced renesas_i3c_irqs_mask_and_clear_locked()
  similar to what was present in v4 in patch
  "i3c: renesas: Add runtime PM support" but without locking; use the
  same function to mask all the interrupts and cleanup the status
  flag in case interrupts are triggered after the transfer completion
  timed out
- introduce patch "i3c: renesas: Fix out-of-bounds access for newdevs mask"
  to avoid failures when there are no I3C devices connected on the
  bus at probe
- patch "i3c: renesas: Perform Dynamic Address Assignment on resume"
  was restored to the v1 variant; kept it simple to fix the
  suspend/resume for the moment

Changes in v4:
- dropped patch "i3c: renesas: Do not attach devices if xfer failed"
- fixed the swap in renesas_i3c_group_devs_in_slots() for i3c->addr[]
  renesas_i3c_irqs_mask_and_clear();
- in patch 16/16 renamed renesas_i3c_abort_xfer() from v3 to
	
Changes in v3:
- re-based on top of series [1] to be able to use
  i3c_master_reattach_i3c_dev_locked()
- used i3c_master_reattach_i3c_dev_locked() on patch
  "i3c: renesas: Perform Dynamic Address Assignment on resume" along with
  grouping the I2C and I3C devices in the driver slot
- collected tags

Changes in v2:
- dropped patch "i3c: renesas: Use the divider 128"
- adjusted the patches title and description where requested in the
  review process
- adjusted the DAA procedure after resume to still properly re-configure
  the controller in case the bus was full before a suspend
- added patch "i3c: renesas: Do not attach devices if xfer failed"
- collected tags

Claudiu Beznea (17):
  i3c: renesas: Check that the transfer is valid before accessing it
  i3c: renesas: Restore STDBR and EXTBR registers on resume
  i3c: renesas: Follow the reset deassert order used in probe
  i3c: renesas: Reconfigure the DATBAS register on re-attach
  i3c: renesas: Reset the controller on resume
  i3c: renesas: Perform Dynamic Address Assignment on resume
  i3c: renesas: Clean DATBAS register on detach
  i3c: renesas: Fix out-of-bounds access for newdevs mask
  i3c: renesas: Use reset_control_bulk_{assert, deassert}()
  i3c: renesas: Return immediately if there is no transfer
  i3c: renesas: Follow a unified pattern for transfer and command
    initialization
  i3c: renesas: Drop the explicit memset() call
  i3c: renesas: Update HW registers after SW computations are done
  i3c: renesas: Organize structures to avoid unnecessary padding
  i3c: renesas: Use the "dev_name:irq_name" format for the interrupt
    name
  i3c: renesas: Drop unnecessary tab
  i3c: renesas: Add runtime PM support

 drivers/i3c/master/renesas-i3c.c | 375 +++++++++++++++++++++----------
 1 file changed, 261 insertions(+), 114 deletions(-)

-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
