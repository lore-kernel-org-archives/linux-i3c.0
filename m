Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C4CD39418
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Apr 2026 13:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vvmciDCV2wMBAWaMizBvGtlpHtYX6xx7MkL9wSUt6Xg=; b=WFtiYbF3XpHATg
	C5dOGl5xYgsys4rKarOxhR1w2zu9TFW/Y2OUTmAtJoApS5rHoxNAJiIxwsdSRXbqJweN9XbwzPOPH
	Ac4ZFF7WfZfe8ezn67jjM2TPSyPQAVZ6VHzfh3lUMXTR3myjECk7mTHYHWuWnoNhibDp+U1ovGzvj
	7z1nxC80SlQhaheV/PgB+cwnT3c/j5EDgzbQEFV5QloeZ5OGIvXv43xwfcJK95wbV/KQ/xvE8QZjy
	1K7eTO9hN1UJqgmnPFNVCxOHkUdeVhZxyVIMzo0MnMDMw3E32SpOap0xv+aB1xgKHXgqlx/Z79Uhk
	5m72O1h6lBTIRveod1Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HkE-000000008dK-48et;
	Thu, 02 Apr 2026 13:05:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HkD-000000008dE-2IXC
	for linux-i3c@bombadil.infradead.org;
	Thu, 02 Apr 2026 13:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=SsM4iUnPFMOflRNoqocwP98hh3w8WDYgeJnYTqtpScQ=; b=HRcH5Ixx1/1KUnACnWJunIrXPU
	xOwFsoetlprBYQ2EUA+ovuyGykuOFZypjtu/ilLDMDu1UDD3qgVqBELoBStCZxZb7p68EOuJu6/Ff
	bUhRH6HYTX83ckTONlQXkZ1cm4gXx9XcjLS8KfQdo3x+oXzlqiAwgYEq1Tb+O6mWUtw50OFzgy0nm
	kX41Ux/ZUsU03QPiwA7s/ZHbii6Uru25q7YG8LYjfyD7dR10s6gp4OZzwsqXFlWZp6sn9Sn97Bnpd
	CHD1QPdv73UUGb8OHF6rP/jkyMSgLsJnOnNLkNz/f5QU6EQT3+CTWXfv1WlzYUGIrgn9iB91FOMyU
	N+DcV7kQ==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HkA-00000002UvN-2jcs
	for linux-i3c@lists.infradead.org;
	Thu, 02 Apr 2026 13:05:56 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-82c28f0a4ecso629519b3a.3
        for <linux-i3c@lists.infradead.org>; Thu, 02 Apr 2026 06:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775135152; x=1775739952; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SsM4iUnPFMOflRNoqocwP98hh3w8WDYgeJnYTqtpScQ=;
        b=qCl4JMCpJgVpGLyb2cNumxuLE12wP5nkrSSOrc4zbeBaXVtWx66YPo5UZuW5kUkrOB
         n61iUpHdcemkPM0s5wrqO9Oyxr9GLlEjm1j+hsiTMOG3x59Yi4qUp+dgRZkbR9RRg4rj
         Vn9nX/gbQV42FNGLulRP3rBw5EawpSa42wi16sdgaqFpUQo9DgodDNecPvwib14eSvqM
         VuR3wPE29sdbcBNMEYVdf98Ya3l52JAF1pOmNAFIhSmKbZ81qI74u8Jbn23cXfjqSlYQ
         xiVeYkmWKk5SQ1TTfJG8m9tuLlvj5v4cAF+rqkDw2RKCBmXEra17mD05QbrAQUiq0LyE
         wtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775135152; x=1775739952;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsM4iUnPFMOflRNoqocwP98hh3w8WDYgeJnYTqtpScQ=;
        b=aFfFSHGfvlxxEphlw1yBvts/IE/MjTEiiffb4baSyCKfcvM9D8qaGwEJoHcQQoS+Q7
         BHZfpbx2LIP2SqQr0idaEtJdgKtoHBVJl5XrWJZzmPCWzkmMdkCfZiGYusbU98m0ISrm
         UBqYKR1zUzo4tClVjUfuTz9kXeafqFJRi7WP7TN2F0HQZ3IRbeVvEmAAWUCnoWkTtjIp
         devtJ9rVjFSttotmaEh+0WHP2yDmXj56qI3Grg0Fl1nRS6SqZaDJu61+JjoKncyyX+nz
         rQH1uWMDQ04m+Bylx6bXH9BjnbcW0x5SzbI78tgQDqrGcAa4yA5ScWSbogsnlllNrqqv
         mrQQ==
X-Gm-Message-State: AOJu0YxOkI2ziQbxAcxszz6uk5JmLd8GgiWk9gKTOUSjy7oXGDodhxK2
	vZcDmy/dfEUiyIvZc7xXuC+eJLzEKOCNNGE9GFTU1zImsLtuDzXovGEHCxdgy346
X-Gm-Gg: ATEYQzzWp3VCzBkjFOu9zfhd9/STRGSufXCuHt6x1HFvQmGRBzMf5GsVj7Lzsz5XR+3
	U2ReJ585KKe0NK6vlULAMgletujtIUY03wpEKrDp1LozX6heNH6sGDCKdYp8DBrEPqm644p6yvw
	VzxlehL3CPDBKunfdsH8sJEPce/+y9nBSlgmAyhVSfaKdyigPiwl5puOVCmee3Y/X22OysjY5OX
	g2b6mek6hACtKWmEZl11NW3ldXDIlYX1S9ZcqYtgdYtoWufjqKFTUdyJAh8raYNcxyMhl8iKVcf
	BCe7kfnhTlerQh2szz8XK4k/6Geu7YssCFjsP2k6NiYebprSvn2aCKyTXRJhqCevJluWcW7W4w5
	MgpUbnK/XVfKFF2pSMqxDRvk5FVWFVq7XQcXTcCVMmNyPYt4lMe48hXFTCCqz8PZJIRdu81M/DN
	+449R9iLlXxqXGleChPCv5BDxrcrTtZk/S+S1w
X-Received: by 2002:a05:6a00:92a4:b0:82a:768c:9a2c with SMTP id d2e1a72fcca58-82cfb87e1eemr4112842b3a.22.1775135151717;
        Thu, 02 Apr 2026 06:05:51 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b60199sm2795363b3a.25.2026.04.02.06.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:05:51 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 02 Apr 2026 21:05:48 +0800
Subject: [PATCH] i3c: master: renesas: Fix memory leak in
 renesas_i3c_i3c_xfers()
MIME-Version: 1.0
Message-Id: <20260402-renesas-v1-1-369a7d867502@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKtpzmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwMj3aLUvNTixGLdZLPEtJTENMukZKNUJaDqgqLUtMwKsEnRsbW1AI1
 3NOBZAAAA
X-Change-ID: 20260402-renesas-c6afdaf9bc2e
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775135150; l=1377;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=xNK9irekmwbrrEP4zDSAZljcTYUdJtgw3ZOC+RfK5bI=;
 b=ki0mryobtCbttTZKex+eAgrImFaTwbISZlYWTSd9R/AfKlBdk/RllErRby3QuYQdwY4h7/3Zg
 PctzGevfDAUC+Kafdn9tx+8wYWAb3ON7IWpW7jkXGLpxD4uXdByYjnB
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_140554_810622_4260AF64 
X-CRM114-Status: GOOD (  10.78  )
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

The xfer structure allocated by renesas_i3c_alloc_xfer() was never freed
in the renesas_i3c_i3c_xfers() function. Use the __free(kfree) cleanup
attribute to automatically free the memory when the variable goes out of
scope.

Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/i3c/master/renesas-i3c.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index d9f5b30a4b2f..11f2d6f7c701 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -817,13 +817,12 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
-	struct renesas_i3c_xfer *xfer;
 	int i;
 
 	/* Enable I3C bus. */
 	renesas_i3c_bus_enable(m, true);
 
-	xfer = renesas_i3c_alloc_xfer(i3c, 1);
+	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
 	if (!xfer)
 		return -ENOMEM;
 

---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260402-renesas-c6afdaf9bc2e

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
