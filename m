Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9362D3941D
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Apr 2026 12:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kWowExWuQcZZgrjG+QPtum8KLx4f1IQsDp5g4ZilG2s=; b=Fes+w3GkbfhF+X
	Sa6oxMXie91bxPzSyVMEOoaxMIk01Awu5+WAe4XNIcM3B2v/nMBiPuEgh6fWsOgQfH4AFuPCjyGf7
	iPgVus61MKGZT95kJU6NUGt/9YB/oUCvjTTjwdeVgwZCRb37npk/1Jo+rFrS80ADrDQCDlBCteEkI
	i1B2ZCqnzLr7bDONkpvDlxSxgLYGE91HNci5q3y+uPLNmtTq0d+oLrAzEBByicyYgGPy7lyyKt9cJ
	JJmICPjjoh9zly3s7VYvFLzIFS7K3WwnUB3YGo3xvj/v6/rcA8a4R+Kk814DDkx0dMTyiZFZ3askL
	LTYMdWCzRSfayE1Zm/mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HJK-000000005is-22l4;
	Thu, 02 Apr 2026 12:38:10 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HJH-000000005hX-0och
	for linux-i3c@lists.infradead.org;
	Thu, 02 Apr 2026 12:38:09 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-35d9827661bso394229a91.3
        for <linux-i3c@lists.infradead.org>; Thu, 02 Apr 2026 05:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775133486; x=1775738286; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dPDZ/1+05Y6u0of082eTUSrc9IsZc4TpToSdrfuKStc=;
        b=Lzr5orlNIwnlt/6akLov6tKgOKbtpeBJ1NttP9vMvP6E3zfTZRFEt2P1ypcalQHEhh
         F5J5rdvKbS4U3IPQ4FF5cLPtDFUHVTLFwj/8XbdaXdmNg+pc3e8wyvk72TO78Tr8gYlG
         Cd10k+L1VgGYUt/qOnze8Iduj1BG1blhWLd6gIiorPa3+hkUZ3Ty20Tu3WgQk/SbmDla
         EtrA0MHWjUI9Go5xgqBHYsII9ZKQOPPnPDQHRn0oEY5KogExA6CA7dJYHGXD62xEF704
         JU+U3+lsiVeapwRatmjN3ykyFA194XXtwMLCLWZQau6z4fOo3BfglYYaso0tF79fpbGL
         u1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775133486; x=1775738286;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPDZ/1+05Y6u0of082eTUSrc9IsZc4TpToSdrfuKStc=;
        b=qokRc/u3z24iF6lYqdgpo7bOQUFPnGCL/aMun1F1Q/PmEJzyYa+DSIz87k6Ani/9sV
         LN2ACadL8K7KuikWJS4nzztc6HimPm8k0S8FbI6JBilFiAwqhyriYpGDG0DWwe69uc9c
         A9Mri4P6tjB34K0bXuA6xiVUdantOl0hgRWWiDP1/NBAfksLqmhMewTBSr34dei/Tphq
         Oz8cbQjlp5nJeah10DqZf5j07g1urNBZNWxpV/GfUhZ78DmEMqrZMWr6nEO+Th0AdQG9
         VS+P/tCQu1WUi0a/Lx+6F8EmsSd0veqwDx+ke3PpRTAScqU+H36Ud+bVP9f8mjm5ckUZ
         Pc5Q==
X-Gm-Message-State: AOJu0Yzp6KziskPvF4wlV3veLPdwdDjlEuSDlQNwWLQvwsZzreRfgl95
	StDjP4taB05WKYCEoYo5reRbPomCP4nOXLVEaGu3Yiz4t5j6xTfssa7t
X-Gm-Gg: AeBDieuIZ3EkK0sXKJD2ZXSangOw3AKmY5hCOZTfOzJW2Xqu5tqiOYwlOom/Z13pxGH
	DXbTstJ9nyq+TOxeJv1vtlguZNYpxNwy+iQpCzLEjq/VVTU75S20LHZCG8hPPN9cMLriIcSYJe7
	YsIXea5bGGkkF2g4IYv8S7+f/wf1cSrVv3YS5PP0kx8rjVLwuF0vHhTN1v/Kep1qDW4UHC831mz
	9PlgSSGWX6nBav82dMfA/xAkHYRG2z2nthhSIC9Ryh3or0aiaJ5DMuge5x7MGqCdS2ojdOD++Zt
	k2W8hOUuFQBMO4oqhLxgvH0ravXQx9fzJzS1izRNmx8Z6Kpi5fXijR4jxop0WR7Wiqgm95PuIPJ
	5JfW402AKq3pNsuV65kCSm2fg/D3J45MP+9Skg34wsC4QlKLtd/0Wdyd2uVd/6or5Cu3lyDd9ls
	KVM/Lz0DKIh5bSmecy8jqspDvCGtWp1HiGIusJ
X-Received: by 2002:a17:90b:510d:b0:35d:9560:3f09 with SMTP id 98e67ed59e1d1-35dc701509amr6280628a91.24.1775133485925;
        Thu, 02 Apr 2026 05:38:05 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe5e4ba7sm7834876a91.4.2026.04.02.05.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:38:05 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 02 Apr 2026 20:38:03 +0800
Subject: [PATCH] i3c: dw: Fix memory leak in dw_i3c_master_i3c_xfers()
MIME-Version: 1.0
Message-Id: <20260402-dw-i3c-2-v1-1-b530970654ec@gmail.com>
X-B4-Tracking: v=1; b=H4sIACpjzmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwMj3ZRy3UzjZF0jXYs0QyPjlNQ0S8skIyWg8oKi1LTMCrBR0bG1tQB
 xKcvbWgAAAA==
X-Change-ID: 20260402-dw-i3c-2-8f123def99b2
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Aniket <aniketmaurya@google.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775133485; l=1150;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=bOmLBwnVfNFs+7IhaXEuMecWccwL4YAiUnEZWQnr8t8=;
 b=I7ZV7CsSHwy4yb2zfC8cEYGbNEksQz3TH2nESCU9klzxzQFtthbbnP8qOU1LATk/AQq8OJ7zq
 LLXxnQRxymYDNZSKNNPGpFXugl8Y845rYR/cexp1VS3+sGfQEF8zQ9o
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_053807_255854_2F5121BD 
X-CRM114-Status: UNSURE (   9.13  )
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

The dw_i3c_master_i3c_xfers() function allocates memory for the xfer
structure using dw_i3c_master_alloc_xfer(). If pm_runtime_resume_and_get()
fails, the function returns without freeing the allocated xfer, resulting
in a memory leak.

Add a dw_i3c_master_free_xfer() call to the error path to ensure the
allocated memory is properly freed.

Fixes: 62fe9d06f570 ("i3c: dw: Add power management support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/i3c/master/dw-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d6bdb32397fb..d933db076c61 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -953,6 +953,7 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 		dev_err(master->dev,
 			"<%s> cannot resume i3c bus master, err: %d\n",
 			__func__, ret);
+		dw_i3c_master_free_xfer(xfer);
 		return ret;
 	}
 

---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260402-dw-i3c-2-8f123def99b2

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
