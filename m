Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6798F53D7F
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Mar 2026 17:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bNxtl7bpxDBua7NN3FB4D39G4kh8qIp6t1dKDTGe7BE=; b=2Le4SVgirJWzax
	PMYmL8JoMs/Fs2T2UhpjTEpIy7NInY7C9xA4GtdjsBkeYGZk3uigmhUc3oiFpS/Z6RL8gqNlAdSAM
	C1142HhV0q1KZ3RHr3yOyFKqBJpQbVBUI+R++lWDK1Bl1T+Eq65/7XzBQUg4c06R+YjgQZeO94hAx
	vTJhbIgSzzrlkCGyNoHONQrVNXC8f/YC2m6kDAv3dOH4uV7XnktHWKzaR09L2kXlbp/9HxDu+CEuE
	0iFd+QrGO8vv3poa2a+bevjo/xP2qDcJ3LYEuZIOA4RL1z5numsAVYG3tc/Aud3E1i6aKXQJq3gVd
	M+wz3oqd8pFCAjGcq1Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C3D-00000004bzV-1gfY;
	Mon, 16 Mar 2026 17:48:23 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C3A-00000004bz2-2Vre
	for linux-i3c@lists.infradead.org;
	Mon, 16 Mar 2026 17:48:22 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so1705071a12.0
        for <linux-i3c@lists.infradead.org>; Mon, 16 Mar 2026 10:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773683300; x=1774288100; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V4r4EPN0k4/5QJ3xUXUMd727+oQtnnk0aBexwlfPH3c=;
        b=HcDpib7v7y20M9uOrsv4hMigQ8zMl0ygS1DsnMxqsYz7vBb/MWVyfmJ7edsXkiQWpW
         wavCM+R+JOG+MIaYlorYMsyBvQqFfA0dYQYG4DwXpJ4vQcDANe5ykwp2pQ2cXcPY49zr
         ZfvF8V/6tfUjeKWv/6ZHq1LsDlK/wyD110HtSopJXdA3YP10+ZT74VQkhilpLtmm4Bu6
         l1hHCO6cT1YlUi1+LJpcYT+asiTBXOTXEgKKWCmR3mosbw1S7GH6clJqpebsrU3tea01
         I4pbV/8JE9rrpFFovqh0VRqC/RPBvkSTHe4siCDtOIi/u6K04KLMxIdU2/0GGfFDC5al
         BEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773683300; x=1774288100;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4r4EPN0k4/5QJ3xUXUMd727+oQtnnk0aBexwlfPH3c=;
        b=Qah0Xkj2jX6n2D8+Bleb/zBs+nunrk33690QdzBi8XOp11sEVP4nB1vBebfhZP2Lbe
         N3msZVL6K1a7nJH6/ZaX2LUfTKMC4E8zl+2qB/ATTkw7GpwM32lHS3tv6/NuWLjPGpHI
         GpWoolmqsZwZhemDh6OI/0gmqKvFlPrAafk4mhJW48XX2fPEoPD+QWLbBui7EWrOkaRa
         Y45BenWidQE4puHM0mlT7v9LrmHmZQTzDzLwDb9k6FdapquTl2EyHBVOjrSjAZ589PfZ
         6GXNtpcYuv2AowbRwV0hAGjpZBlj2/WJONbX31rNh2LFlP1U5NNvE4SLkhjZXIPLc+Ep
         UOLw==
X-Gm-Message-State: AOJu0Yx+xqegtK3HfUusglIQ7maTd5BM2QrhNHkdy6SMhEjpeh0dbFzk
	SfL6MF1A1mUSowSrnJD9/BBARlz7OLGCAqHzslknByCxWgumQtutvJQCenaM7TyZBSc=
X-Gm-Gg: ATEYQzxhYqOfEh5CBvmW/TcRhXq2k9cPIZX3+Vs5XJU19mPooGJzZ12atmfqkjiuq6s
	f2QD3G2gmh+XuyOsmhr7vKZJGWJW9vbAQYotLkW+/MTP+SbiBfdvFJ3Aao1gUw/R5L9VrBy5rTo
	1/Vuf46O193Nzi3WeHMS5+/zdD9sd6OtiErGtR7ZnAUSYgvG5anzjUQx1nYbqQTXBQG7gFhSun5
	fe284ES9kxL47+ZFz1B21nMqyNE96wv7k7pFxMYIIWcrUgbMOvqHC4VH2tHvTIBcdQ3UnyE6UYI
	tgY4+B8GzNaucrBLhL/bVW4o1tm3WXB1WT63oxpll8VeCEWTHHZFHGYRxd9sz4iJvWeCj3kYIhZ
	WVdnAQ+QNJPW6u9XKFG59wbeQAQNyCCsOH9NmkBw29tfbIe3+0Bx8MmYFH3ZjpesoJH+LIU2SFx
	JHamBSs9TZ4WXHV/sg6UK59mJVW4rSkoUnzFrh
X-Received: by 2002:a17:903:41c6:b0:2ae:5345:89ee with SMTP id d9443c01a7336-2aeca9589a2mr125945015ad.1.1773683299538;
        Mon, 16 Mar 2026 10:48:19 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ed6cfsm146391765ad.59.2026.03.16.10.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:48:19 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 17 Mar 2026 01:48:14 +0800
Subject: [PATCH v2] i3c: master: dw-i3c: Fix missing reset assertion in
 remove() callback
MIME-Version: 1.0
Message-Id: <20260317-dw-i3c-v2-1-fa57e6394b1d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAF1CuGkC/2XMyw6CMBCF4Vchs3ZML6SAK9/DsChlgEmEmtZUD
 em7W9m6/E9Ovh0iBaYIl2qHQIkj+62EOlXgFrvNhDyWBiWUEVoaHF/I2iE1VpvBdcK0Csr5EWj
 i9wHd+tILx6cPn8NN8rf+EUmiRDvUshP15JpWXOfV8v3s/Ap9zvkLsIt59pwAAAA=
X-Change-ID: 20260316-dw-i3c-e7a36bc90682
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Aniket <aniketmaurya@google.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773683296; l=2173;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=9pPeX9Og9XKvw52be7oukqVQdGpyIJ+ESHORa/A+tiE=;
 b=0Tc3dLmA/m1BZHxHoc1k1QWs8lf+DLHIWaHK9TqAhUxBqTcvrMK+uroa5ZKf/zu57mNLGyu7p
 b1m2OFB6nOLDe/dhIhfk8AyxnoWeITcGHfRrdjld9j64eGwzCj4q+/6
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_104820_675377_B0620B7C 
X-CRM114-Status: GOOD (  10.04  )
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

The reset line acquired during probe is currently left deasserted when
the driver is unbound.

Switch to devm_reset_control_get_optional_exclusive_deasserted() to
ensure the reset is automatically re-asserted by the devres core when
the driver is removed.

Fixes: 62fe9d06f570 ("i3c: dw: Add power management support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Switch to devm_reset_control_get_optional_exclusive_deasserted() 
suggested by Philipp Zabel.
- Link to v1: https://lore.kernel.org/r/20260316-dw-i3c-v1-1-ab41904fc780@gmail.com
---
 drivers/i3c/master/dw-i3c-master.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d87bde3f7700..f3dabd8d1225 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1606,13 +1606,11 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->pclk))
 		return PTR_ERR(master->pclk);
 
-	master->core_rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
-								    "core_rst");
+	master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(
+		&pdev->dev, "core_rst");
 	if (IS_ERR(master->core_rst))
 		return PTR_ERR(master->core_rst);
 
-	reset_control_deassert(master->core_rst);
-
 	spin_lock_init(&master->xferqueue.lock);
 	INIT_LIST_HEAD(&master->xferqueue.list);
 
@@ -1624,7 +1622,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 			       dw_i3c_master_irq_handler, 0,
 			       dev_name(&pdev->dev), master);
 	if (ret)
-		goto err_assert_rst;
+		return ret;
 
 	platform_set_drvdata(pdev, master);
 
@@ -1671,9 +1669,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
-err_assert_rst:
-	reset_control_assert(master->core_rst);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dw_i3c_common_probe);

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-dw-i3c-e7a36bc90682

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
