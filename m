Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31DC1094463
	for <linux-i3c@archiver.kernel.org>; Sat, 21 Mar 2026 09:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ThYdkHaNXfzN38m2jFMN3cIAHcKD0oAgjTBVbFKiSYQ=; b=rYNzg6AKLQe6eO
	VYavWs4hJB21hYGHzANarN/sPm+RuSRDLoxdn0HZUnA2iX3WhyBLzvDnoR+cENscee8BzKG9BeoUF
	3vbD78yBzv0fEuWsc5wGXq+PO71fBNhD3oyfXx+utSDTiBQcxPKM7M4hcZ6dJvVwWzLpWSqXtZHDQ
	fWZ0ABjbl4MaLQy5T/p1vrtMYGxmGEneYc8NG4pwNMQgV12mobK8fTphfiiPowPUFixBMqKqZ9QD4
	xTjR1dB7+9t0IFoWmNqTw0v5q4aJDwO+UEFbOibTuEsU0tkKCFw0k/onm2y6fYhb+FgfsAlUTHIRa
	5Ol1cYTQcbC8LzOvIGXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3sGL-0000000EHxd-1W3t;
	Sat, 21 Mar 2026 09:04:53 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3sGH-0000000EHxJ-3ZNd
	for linux-i3c@lists.infradead.org;
	Sat, 21 Mar 2026 09:04:52 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ad21f437eeso22853165ad.0
        for <linux-i3c@lists.infradead.org>; Sat, 21 Mar 2026 02:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774083889; x=1774688689; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hpUZe8TkhEecqawtonAmq2cSOitTvDySQl0V70wMD9A=;
        b=KcswvApZ4Ud6s6Q/At6kRzaE4bMl3zapmKjaS2bHO372rSjgQPjmVdxg50HLcSjnYP
         n0+BWXW+FRsgixcGiIBcjGV+kCm4hdnKK9fUlE9pRSe94QykhvgjaEqQd57Kcc5FkzHT
         vsEK0qE4/+BlfOehUmSra1JspBlMgw8o3gQ1S3pgX3zwCojZWOWTz94ynSwN2XXMd2W+
         pgieJuJLYiXvfpeg5eL88ocvZGMSNZ/7UmMemkAL6qbiIPN+L+Gr5UnnVXaRhO0h1z/A
         ThSUkxtCwjy2lVUTvtqBo+QtQo3MxYCZYB5LjFNf+jkW3LGbGd5x8Pa9EVDw9xPceyH/
         KX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774083889; x=1774688689;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpUZe8TkhEecqawtonAmq2cSOitTvDySQl0V70wMD9A=;
        b=ZXrePFvaCk1NOyaHYpv2PeWqDYEkBGsf+VSfQV8FxwyB7n9OlAUDBSyOFiFgF/kdrG
         5Xqnr8/BCHEo6nnDIbYXtdjAsd0AR9YUUT3wOMG+kYFSJFJI/8U90xAFWnHGw+cDm6hm
         O8/i+54iFZ0JhStZISbT3BdjwYfIYZhMlzfRSYS1f9SwP7Y+9nOjVOr2F5L5IXV74Xql
         UZTBI4h68a7fAwWRhjtfPFu3m0ntReG0z0Az46w8CvZvj9YkKupHGaJqJETvigQlxbUV
         1+ypGbDSQp/HMW7EIoOaeAuoUFtTqHN9PcyU8HVjtxivLrySH91IBGYj5WCOqp9xGWm5
         ckcw==
X-Gm-Message-State: AOJu0Ywawrt6Q6P6buVbTpHLphK2INFz5VkeSVbTQCznswvdQ/pRxDXX
	EogjHAa2wXpksSgj9w2sGpTIOlTbXBtcYsUGUaE4MywmvMEh+HN8U98g
X-Gm-Gg: ATEYQzxjm2iCvckAxdeL/+6+IOSWtSYrGu5wssJb2iIa2OsDtLJd0at6qOuwgeXhWHZ
	9T/QPHTrTsY0GLJykQJGISxuhKZgATccnPz+bqWvBCz6oEm+wx5WkKq659MaQdcZpGFzqZUC5Lx
	6Pd8SJ4zRrl8gGcizCghv//bBz+QCRQgChhr96wgo1CNiKMyxJJTsId8lmAsn2Corc0uyZhgqCN
	u+GGVkJhZcv/L/tgoFLelyiKQ29dx3DTzOSMqfa5AJRnT95+5Pz67wILpD2gYnziqp+3ZqvhrHi
	pphsJ4/MDA0mZbREYqRSE0KUuRChjTLuM3OHHjAy6XkjdC2lN99iMwfLU2B5VKv1gKKc+7kU7gl
	XVq+OY4gqST4exgG1eklq63RGUajxXTzpYnsh4Kq+TKyPzN1Uhl9YdpDpGj+mry95th0MUymk9I
	V7b82dXOBtP/3bFnIqTUyHXrEyGpyu6kxQ7miu
X-Received: by 2002:a17:903:1b6b:b0:2ae:cdf7:4740 with SMTP id d9443c01a7336-2b0771d687cmr82325135ad.17.1774083888501;
        Sat, 21 Mar 2026 02:04:48 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516aa6sm64122275ad.9.2026.03.21.02.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 02:04:48 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 21 Mar 2026 17:04:43 +0800
Subject: [PATCH] i3c: master: dw-i3c: Balance PM runtime usage count on
 probe failure
MIME-Version: 1.0
Message-Id: <20260321-dw-i3c-1-v1-1-821623aac7bb@gmail.com>
X-B4-Tracking: v=1; b=H4sIACpfvmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyND3ZRy3UzjZF1DXUsjIyOTJGPTFPNUEyWg8oKi1LTMCrBR0bG1tQC
 vBUIPWgAAAA==
X-Change-ID: 20260321-dw-i3c-1-92224b35d7e4
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774083886; l=1264;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=pPBWxJByBIMPVhwWVZpfO/kWIevj/fEs6rDai+Ej678=;
 b=tPJZILubpuxGwtuzABBn0GVIe2w8utfijftGaOjHS1H5mTJPwxMMvVH/pDDSbCg623SQcIJEE
 JX6k5prjHYmDCXf5s8EUsk+6aSpdN+hyR0crsyTMEdMaFQ35y5XBygM
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_020451_035386_AA1E8059 
X-CRM114-Status: UNSURE (   7.93  )
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

When DW_I3C_DISABLE_RUNTIME_PM_QUIRK is set, the probe function calls
pm_runtime_get_noresume() to prevent runtime suspend. However, if
i3c_master_register() fails, the error path does not balance this
call, leaving the usage count incremented.

Add pm_runtime_put_noidle() in the error cleanup path to properly
balance the usage count.

Fixes: fba0e56ee752 ("i3c: dw: Disable runtime PM on Agilex5 to avoid bus hang on IBI")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/i3c/master/dw-i3c-master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d6bdb32397fb..9c8de64c203b 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1669,6 +1669,8 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	return 0;
 
 err_disable_pm:
+	if (master->quirks & DW_I3C_DISABLE_RUNTIME_PM_QUIRK)
+		pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);

---
base-commit: b5d083a3ed1e2798396d5e491432e887da8d4a06
change-id: 20260321-dw-i3c-1-92224b35d7e4

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
