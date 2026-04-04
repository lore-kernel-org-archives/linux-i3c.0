Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB17E88D8B
	for <linux-i3c@archiver.kernel.org>; Sat,  4 Apr 2026 10:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BbYuFjzyQBohn4/GJ19euYntl+pZNS9xNk4oYeNT6Kk=; b=SnEIAp6m28Qimy
	A6Rz1mtweR8CENy6UvnetU6QCGa/SQAGthkNB80Ia+JX1k+I7mjkjHNkODHqwEKP4RWeIfbFq6Wil
	z+BBDl/iueT7mJo7y9C5L08Nq06avKTU+Rruyq4H36nZyTCHMTIaAV3nwDa5754kySE+/x7ZfiJy9
	TATEMXUXQUUtWJ5AZdEOStvM41XyY4reuUNOrxAltIplvgEjFGyl86NAy/CQKKVdHEdi3B2Cxq3YJ
	1eYVaNRyQ2Y7hZmzxVCNWHG+08ptfghbrgFl04KqMoKNeRgptRy0dHm+gxtbr1O8bU/0igIXlJzPm
	f4Dlv96EIS1Vd2+iAEdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8yJI-00000003NuV-2L7N;
	Sat, 04 Apr 2026 10:33:00 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8yJG-00000003Ntg-04Y3
	for linux-i3c@lists.infradead.org;
	Sat, 04 Apr 2026 10:32:59 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-82a67ce6969so1895634b3a.1
        for <linux-i3c@lists.infradead.org>; Sat, 04 Apr 2026 03:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775298777; x=1775903577; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1uJhHvX5gI2mQEV6rLblZbLzC8hmg0na0KXE7+Ixn24=;
        b=Li4CnzrttT5oRxF9P5kvXx3UlAtxCTa8zwGFRes1pF6YjsjjYc7SZ3DaufmXl7mO28
         cm9E1B3PxLDGeuZ6q4k6qIq7WGWWcE3whSFv3AxIFEcFdjn0ZgAkGvQBw8xwQ/xHd35p
         u0Uok/9S3UB//+TwwSuDA1+oThmncOe7B0Q/F3wz0oYLSzvWLI0eEuIszDCipXL8HeaY
         biNWhQ/IqjBdLYm1ZIytS/wjcrdgX++SJ2MNUsR5EWNM28betNpt4Deqt1UAczYbW6hT
         ML+Kxme6DzipHB8olaR+ZELxb16I994F9RWvQ253NJoXrJh8DYHg5XxTYEJQGV2u0mfw
         JJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775298777; x=1775903577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1uJhHvX5gI2mQEV6rLblZbLzC8hmg0na0KXE7+Ixn24=;
        b=gg6c0SZF9pXkSfxkjtcXH4N1zmFp5+wKfViTiwrKZ6rmPRpbW93bRzxZ/xJQlloB7Y
         eHOw/T9bsNSPwm2ZJIx2uWZpqP6xV+zDKGwIXluOOlAihKJdT2x0Vn4tWmSLhr6TQlxe
         7H//79xxKXHxpqTt/ocgkwYXbwABLc1AgtuL3ilge1D0/SxyhISPxdPevO0zLloh/oYs
         8ugy5D2Vo2FU/1LPb26nA0BvcKxdLm6hhlU5IW3C5SmSmHmZ+qwjaU1zM9f9XfadBPx7
         Fmgcp5HjEjMK5GJPy17K9DIpd/RrQYj9zmSbHx2mU7ztMMmI6RAKbl2NnEVFX6qFKjqK
         R1kw==
X-Gm-Message-State: AOJu0YwNDUvEnnwPwum2ZI7vuxyO3ZzL43R26vo+CjmZBntbUYB1fqP/
	a6cnPp6cZEo/pNhiTlV7eVDuS7+/489LqEdHeNFJ48qg/9W7lJFNIjj0xSLNz9Tr
X-Gm-Gg: AeBDiesYf/yhjy6FJnjIsowlRrJJ9Pf8m0LF5s8GTYRZL4mWm+sseHFXyPQGqnW6QVi
	sTo0SAGPDW07QnnvNDJfRq0geYI54WovC2COqitszGBCYqLG8SL1g+Ye2Pu27pK0kQd6eiDs7nZ
	9zccfW4REyt13k5Ugf86M0UGMZ6uEUpmZJDFKl4zFb5iqHQhkWD0EwvFY9/4qjrjIEz2ynlceMc
	mnD7hKehGKDO6VRXQk/Oir/VkpqzX6d3QS1dI65UVsrBHi71B8rkONl5DKoacE6oayHcpsyi8pt
	q21zMlg3WsPcZ9kSiUfSPSx8v3EYB1pNkn89zk5+/csvLtep3EvlVkUtgrSbRbgHtOwyoUNjEBj
	qh862gy2N/56aWy2GNG+P6PLJZIHVU5RZmQBnN/dwLHsF/L3zoLYsu1Yvwu/1pCoH6rwgRD/QOp
	5SrwOjlttV+eBqrTpMqXO0RsiZurO2gCXYj2s2MoiHHWfn3sI=
X-Received: by 2002:a05:6a00:2315:b0:823:1212:8e87 with SMTP id d2e1a72fcca58-82d0db7db66mr5922579b3a.32.1775298777047;
        Sat, 04 Apr 2026 03:32:57 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b27064sm10475789b3a.9.2026.04.04.03.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 03:32:56 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 04 Apr 2026 18:32:30 +0800
Subject: [PATCH v3 1/2] i3c: dw: Fix memory leak in
 dw_i3c_master_i3c_xfers()
MIME-Version: 1.0
Message-Id: <20260404-dw-i3c-2-v3-1-8f7d146549c1@gmail.com>
References: <20260404-dw-i3c-2-v3-0-8f7d146549c1@gmail.com>
In-Reply-To: <20260404-dw-i3c-2-v3-0-8f7d146549c1@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Aniket <aniketmaurya@google.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775298773; l=1890;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=cFlCBrk5Btt9A1O7MA9Le1CAuW++BN014THB/os1SKs=;
 b=ZVcn3NAsKwKqdlA3PAMNbyOXcW7sBpb5TSv4olRL1t5ZAvEK/kSTN/whCv7OHv9GH6WuvA8pq
 oPOxHolQDQ1B8mEKNY7nwSoj8oA+LHF8Q4vRvse5EXwVJCPk7kz6EhU
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_033258_090579_E42988EE 
X-CRM114-Status: GOOD (  12.06  )
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

The dw_i3c_master_i3c_xfers() function allocates memory for the xfer
structure using dw_i3c_master_alloc_xfer(). If pm_runtime_resume_and_get()
fails, the function returns without freeing the allocated xfer, resulting
in a memory leak.

Since dw_i3c_master_free_xfer() is a thin wrapper around kfree(), use
the __free(kfree) cleanup attribute to handle the free automatically on
all exit paths.

Fixes: 62fe9d06f570 ("i3c: dw: Add power management support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/i3c/master/dw-i3c-master.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d6bdb32397fb..2e31228b3809 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -7,6 +7,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/err.h>
@@ -924,7 +925,6 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
 	unsigned int nrxwords = 0, ntxwords = 0;
-	struct dw_i3c_xfer *xfer;
 	int i, ret = 0;
 
 	if (!i3c_nxfers)
@@ -944,7 +944,7 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 	    nrxwords > master->caps.datafifodepth)
 		return -EOPNOTSUPP;
 
-	xfer = dw_i3c_master_alloc_xfer(master, i3c_nxfers);
+	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, i3c_nxfers);
 	if (!xfer)
 		return -ENOMEM;
 
@@ -995,7 +995,6 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 	}
 
 	ret = xfer->ret;
-	dw_i3c_master_free_xfer(xfer);
 
 	pm_runtime_put_autosuspend(master->dev);
 	return ret;

-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
