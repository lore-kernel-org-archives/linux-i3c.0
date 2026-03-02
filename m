Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7A2D58E79
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Mar 2026 07:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sr8uMEm2Td8LBjqi0vhiKl9RVraQ7XGtuRi6eqH+A9k=; b=evfFez6XCVF5Zl
	Y4dqEz5GSDtIJXSlIP9QxIWk0Nc5mIGQQwvd8JJ/t3hcbyG2apMRcuXz4OLUDY8+PAfBXndMon9eL
	4OKXpvZLEZ7QG3DvycY7+UyV4VaSYd41PoteZUWznmKc0G+r5oB1ivWrXJzECOodRkt6I4FhAkwDM
	yXyLxX6Mvt+DRETr2NaB0CNqBBgwh2ruKV7oyBxXeFtLLDst/t0bCMfUrY3XDd5NcqCBb54y59oma
	2Gt1B6Wv2mtGMHDGhTBgVzADlOypsQQ+T/EJvLOy2bBxiBgNa3Mn1nB2cna/8FtYIDAhthUOhmNQo
	FMUvPmsqk6WlFwB1i18Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwy97-0000000CRfo-3SsT;
	Mon, 02 Mar 2026 07:56:53 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwy94-0000000CRfR-3yKa
	for linux-i3c@lists.infradead.org;
	Mon, 02 Mar 2026 07:56:52 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-827390e8a3cso2644735b3a.0
        for <linux-i3c@lists.infradead.org>; Sun, 01 Mar 2026 23:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772438210; x=1773043010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pMmgfhBN8JIio/muSISa+bM34xTVRH0UV1zFbY/7saE=;
        b=VTmv0bVUUOiRlGw+edPnl3yLLn9uDZxMu4rYAHnMwbAPbbL91eAZMjmaio3uaEF4kG
         nsxiTbuNt5U+qe86WZA80eEjJq7xjAYkjs3eMpn+zTsR7pTwmj5HWQAQYitgpy5CkBJp
         dkEB8wdqhNILuzNMVx/lerZBaaVHO/qxwyvK6Pb6ynrh+9PtuHKy+2alZ6KeEgC1DsDR
         mYymB4l3t9CKZ6Q/KpcKwelI8OrE2pI7Shpjgh6mU/cjr1Nv6dk7xTA5MV1a7L0UHjQb
         OTYxR/gaO2mAs4cyqakLVmig0luMWhbubzVVcDLCRFqon7WW00vVFmUd005UQGz1Sqz7
         fJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772438210; x=1773043010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pMmgfhBN8JIio/muSISa+bM34xTVRH0UV1zFbY/7saE=;
        b=EwxlcXCMy4/sHumARKTZTk98T0jdZG8VNR9p2WLxy2vIeCviSMoR6Hoizri0sSQWRQ
         NNhgbTzGrMh2Wqt2NBjCCFzhkDkE5J5ZkRDX9Jsa4HzTk8oE0ndper1rp935Bapo4/Ih
         BKn9njZDwjNdPpM440HKBflb1lNYFNpagf0BBWqjOTRL2KtxqIkNDP02chrjQAc9wWoE
         zb39FXLjFQRMRulqqKyW+x3X9bjcUrO0aAV6XOSBARrIkov6vwmk90wXSTC1l+saH2b5
         4ARA7SgILI2mh/0ZbV0bw/emchojxCSVwRcFWQKo36XhO1J0jv0MqQZhlDrzDChdhSxX
         lWGA==
X-Forwarded-Encrypted: i=1; AJvYcCVPrGYURf/cwKf+AF/aMykDRU0qeGlX5YighY45xQV5lYT1V/K5GoK8K7HOfOh+k/5u19ra6WWF3ZA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxD8T87hbpJ65z/BKtxK4Kv6jzFqzHbuIhYLhfNGgVgBrDt7BqD
	JtkYKmwOJ0vSdsppcQVbFrt2MO4wu2bdu0kPRLbP06ZjQe0RvqYeTrvd
X-Gm-Gg: ATEYQzyiPXF+UhJG3eYHi0VWkXy2bi1I6tF1f2M73QG2qQF/evH8mKUq7VcwqADZf2H
	gdO3Fko94jvOtNr/8JiJsXv/PEtn6Qs3HmhmR6I7uEtebD72OHhpNIOM7U7Dopbl1hBPLrFmOxs
	EA9MjP3K0lWSWGw1H0FGNLCI+3HfxlUzXJ4st5QPdE0r/CJpvPJ8/p2XO++BtjcU+vaG+IuhCVS
	+j6eSQX2s2WnhwzFNpaSI6qe/oH/62b8gQW0+4uyl1b4STFrMfA7I4zoXksm1xCH4UtPTxtA3PH
	ohZPTTGbadE8f7okH8EXxH9podDETlBp6EV8RfqfUVHNwa2EnghFtotZ5Dd9YTDUbMPZO6iWUC6
	GfAS/5Bfavt3Wc6VqYKYEg4IMFtC/QIeiLsXUzH80ysm1DJnx9oLmSYpAHmod1jUnMV+o/ga4yw
	XulXH9VU2tWZamRTz41xl2zeNa9gkYJGg7yzatzm57uBZHKEBnRXozs4L7aP8uB1uHoQ==
X-Received: by 2002:a05:6a00:2d17:b0:81f:32cc:b1fc with SMTP id d2e1a72fcca58-82739742f80mr14364093b3a.3.1772438209644;
        Sun, 01 Mar 2026 23:56:49 -0800 (PST)
Received: from eric-N-A.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a010996sm11881322b3a.44.2026.03.01.23.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 23:56:49 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Zilin Guan <zilin@seu.edu.cn>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] i3c: master: dw-i3c: Fix missing of_node for virtual I2C adapter
Date: Mon,  2 Mar 2026 15:56:42 +0800
Message-ID: <20260302075645.1492766-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_235650_988362_58DB390E 
X-CRM114-Status: UNSURE (   9.50  )
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

The DesignWare I3C master driver creates a virtual I2C adapter to
provide backward compatibility with I2C devices. However, the current
implementation does not associate this virtual adapter with any
Device Tree node.

Propagate the of_node from the I3C master platform device to the
virtual I2C adapter's device structure. This ensures that standard
I2C aliases are correctly resolved and bus numbering remains consistent.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---

Changes in v3:
- Use device_set_of_node_from_dev() instead of direct of_node assignment.

Changes in v2:
- Move the fix from the ast2600-specific driver to the dw-i3c common.

 drivers/i3c/master/dw-i3c-master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d87bde3f7700..d334c217c7a3 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1659,6 +1659,8 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 		pm_runtime_get_noresume(&pdev->dev);

 	INIT_WORK(&master->hj_work, dw_i3c_hj_work);
+
+	device_set_of_node_from_dev(&master->base.i2c.dev, &pdev->dev);
 	ret = i3c_master_register(&master->base, &pdev->dev,
 				  &dw_mipi_i3c_ops, false);
 	if (ret)
--
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
