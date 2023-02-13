Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32850C64ED6
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Feb 2023 10:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mKbcOM9ZTzqo2aaMxuitRBzBikCOn/spvu5XA53gjPI=; b=krUTvBhEkDBbOvxFKKJvbUZE8P
	tmO89/RXqz/tqNIpA/AO7Cl0DR06GdcxAMS6UqpsjIikxVORgUS8d+F9dnL5C4LGihO6+2SWLr+v/
	PZM43Izd1Ik4cdN2vpOQcmu33DSnsgO5SNSbekVZz792zW9BbyN7PjrXkulKYfl+F8e8mKviQdBje
	Qr0BaQa3xn+Q/D3avQZo7cFnLU1X6TrSCXT4I8hjl/ZRbWwdlv4YITHaaqVmL/0Pi4QFJGQ1kAW7I
	nxDRGr/6r5hdVO36hLNPYFGsKzoLpptFjvkQ/dAHafZ15/7q7lqbMwvUTrhnEWNqrLwMMv/uTNJ3Z
	y4qCOMBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSFSW-005WLI-De; Wed, 15 Feb 2023 10:56:20 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRgTw-00GMfy-9C
	for linux-i3c@lists.infradead.org; Mon, 13 Feb 2023 21:35:29 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id x15-20020a25accf000000b008efe9505b2eso10522139ybd.22
        for <linux-i3c@lists.infradead.org>; Mon, 13 Feb 2023 13:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PdJ1tp5BiJDNMQ/GqapnjMVMjw8EnE0csiFC8jjJC2g=;
        b=V2+l6S9gRQygVGZUYe2NQVc+BEkwO1tf//aHZaqJaL3ggrS1OqOqBYFcAc8wqnBP66
         Q2kgejB92NzRa020Ysx4Bw/uzGW4Riob0CdFI7GlTritQSNTE0AoYB7Si/dy7483pSDk
         tDpBqJg3EgsY4dpa36qtoyjRncfuy1NPeTsUKo9viC+eFT4gLEJnC/t1lXA9jnqwhwui
         AsLZIk1jCHuAdUNg/LH3puvP93GudCrUEJu/rADnaRUVfGe1cKLCJvGtXqAjZBKAI/l8
         V9DMIZgPPi+fgqghdQHRFz2HfFeGe9nn8QvldpWW+eFVv9cu/7MFuf4+S4mseH++IgB5
         Kmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PdJ1tp5BiJDNMQ/GqapnjMVMjw8EnE0csiFC8jjJC2g=;
        b=4uyhMA8IolOgx8Biu7aYIz+n2iIak9s0tojyqttjdLM13tTvP9V62YJLd9frAvHzyc
         NdqBEO2o5/Toe0SFWDmzKkZL2fVS87kEIAVYPiUU2T4Zrt6Ukiwh5134wPxhGVw04d1i
         NsQLtcNgHKpiBnL5TJqgf9jbIMB/kRVD3wXzT6AWoLxO1ZsU1/LrSe8V5tei6byyFIG4
         W3OkF2L+IUUKMx0P/zSJ25+wnBbUMJxx3TRmiCDEmCljI6ws/eYur3AagkHDpnxwOh0G
         W+6JB9TEyRmWwdpV/+j8EGd/DMcHURHP+CPy2OCvkp01D1u+CbVP+CDxAxzB1L1FMfyR
         KwRQ==
X-Gm-Message-State: AO0yUKVlDo9mfqliMv3qb5ecPQNrBUjyMIb1G21nqMvW7tx1vIJs/KwC
	aTzeSaUjxPSy02aySeZ1PeTWbwGtR9Zc15g0
X-Google-Smtp-Source: AK7set/HyoEf9l5BGdwVOVkiiAUolD7hmC4qPLzSRYdjMWQNdQVGPD9teOVoWC4bkjYoyvnoQShpLOyegrh1CiRf
X-Received: from zenghuchen.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2448])
 (user=zenghuchen job=sendgmr) by 2002:a81:5f83:0:b0:502:2e7:f7be with SMTP id
 t125-20020a815f83000000b0050202e7f7bemr3401127ywb.30.1676324126092; Mon, 13
 Feb 2023 13:35:26 -0800 (PST)
Date: Mon, 13 Feb 2023 16:35:21 -0500
In-Reply-To: <lkp@intel.com>
Mime-Version: 1.0
References: <lkp@intel.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230213213521.747253-1-zenghuchen@google.com>
Subject: [PATCH v2] i3c: update dw-i3c-master i3c_clk_cfg function
From: Jack Chen <zenghuchen@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jesus Sanchez-Palencia <jesussanp@google.com>, Mark Slevinsky <markslevinsky@google.com>, 
	Jack Chen <zenghuchen@google.com>, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_133528_350294_6F7FD882 
X-CRM114-Status: GOOD (  10.93  )
X-Mailman-Approved-At: Wed, 15 Feb 2023 02:56:19 -0800
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

Bus-speed could be default(12.5MHz) or defined by users in dts.
Dw-i3c-master should not hard-code the initial speed to be
I3C_BUS_TYP_I3C_SCL_RATE (12.5MHz)
And because of Synopsys's I3C controller limit (hcnt/lcnt register
length) and core-clk provided, there is a limit to bus speed, too.
For example, when core-clk is 250 MHz, the bus speed cannot be
lowered below 1MHz.

Replace max with max_t.
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202302140331.EVRBei1L-lkp@intel.com/

Tested: tested with an i3c sensor and captured with a logic analyzer.

Signed-off-by: Jack Chen <zenghuchen@google.com>
---
 drivers/i3c/master/dw-i3c-master.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 51a8608203de..48954d3e6571 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -531,7 +531,7 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 	if (hcnt < SCL_I3C_TIMING_CNT_MIN)
 		hcnt = SCL_I3C_TIMING_CNT_MIN;
 
-	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_TYP_I3C_SCL_RATE) - hcnt;
+	lcnt = DIV_ROUND_UP(core_rate, master->base.bus.scl_rate.i3c) - hcnt;
 	if (lcnt < SCL_I3C_TIMING_CNT_MIN)
 		lcnt = SCL_I3C_TIMING_CNT_MIN;
 
@@ -541,7 +541,8 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 	if (!(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_I2C_SLAVE_PRESENT))
 		writel(BUS_I3C_MST_FREE(lcnt), master->regs + BUS_FREE_TIMING);
 
-	lcnt = DIV_ROUND_UP(I3C_BUS_TLOW_OD_MIN_NS, core_period);
+	lcnt = max_t(u8,
+		     DIV_ROUND_UP(I3C_BUS_TLOW_OD_MIN_NS, core_period), lcnt);
 	scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
 	writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
 
-- 
2.39.1.581.gbfd45094c4-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
