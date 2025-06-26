Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031C9C83F09
	for <linux-i3c@archiver.kernel.org>; Wed,  2 Jul 2025 22:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PNsgigrmoo1oS9h85qlavrZOegkowg+J0GNArpM9d80=; b=mlqOlDNvWRJNx3
	TbJJ+qgC7vMvWDjphNn9VzUy9yW5IqdHmoihF6TZE1ixZw49Eb7gDfuGbIdLeurejWJ1W3FXGHUHA
	ZbI/5gGb1nHYWuh8RfVIIrrjuuHdY6b4Sm5XGqeGd+UW4IDnXz7DxCRofgu8M1c+l+1lFQ8Wcf57H
	TCH35qVPxkLhhg+EXDjvNp2JOK4qb1Qnpe1Ox/oj5n0+r270LU/nchXwnxFd/Vd2LTYS9UiajP7PU
	XXCx05h0CkDbzZfPM0C6+4kf1bNIRylNuf/ffM9D57X7gEGrMfoK3dKwJGtwfGgGQfIOJ5BXMkAUm
	+P5eufod0I2mit3Lk5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5bS-00000009f5N-2XXd;
	Wed, 02 Jul 2025 22:06:54 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUe7o-0000000AaFd-0Sua
	for linux-i3c@lists.infradead.org;
	Thu, 26 Jun 2025 04:22:13 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-747fc7506d4so653337b3a.0
        for <linux-i3c@lists.infradead.org>; Wed, 25 Jun 2025 21:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750911731; x=1751516531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QsRX74URtN50YlmM2nO+stjiGb2iTvHpEbZ/qJ9EI9o=;
        b=g0xoAPUAHwLI56YXRemqGTDwVYNLbA9p6csxuiJq0AXXfjUg8qaFagXT0cwC4c9tW/
         v5LcEg71i9ID5Msks09Bqp3mGI/ojuyaaAfCnsoMCCifOnhcKutR3l4NxKsEYvF7gmo0
         AXKQsGUfbBtXX5CsobWYj3Yoxc+fydgAmRUHDT/rLMPd+mPq1gCLPaw1ethNnM4zloFu
         pFQwFQQacLFeloWV24XKHBePAeymXYzakLvnUCNkLeIY6Vb+DIPQS0SzugzsopRk1KHr
         VrwcDocMdv/jQ5EDBa7xCGujageHwkUWnFIa/h+pPb6Cxqc2dUL+2U7NUHVnpwzSyG0g
         zOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750911731; x=1751516531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QsRX74URtN50YlmM2nO+stjiGb2iTvHpEbZ/qJ9EI9o=;
        b=fXQDB0jqLQEHf8dDTV5AMsAQvN7qmUD/EDU7bjFLeNKflTsNaLB4hxMib53BflFvly
         j14WpgxZ11g0lqUfLgxkRNpiBVddfpZyr5RfZxQ4fuS9dKjmXDzfhjK0tP/yVSl+M3O9
         j6bPWfnC+AxHxvyxPyYwhrgvDIqBy8llwL8zlQsvNf5lh02zlctAIIy+Z+J3wtzQb2n6
         z/O9cQ0HZZg0K+SpIVZx+doeTRgUDXCpNZhHkeCZtCxFBBRxljTw7XIKAoh5pP6Xjxnq
         9Esv2HLk4y7ufMiVqRKcIxbO07HAVZmGjOWAUkeLMjU71beV/5y00VhmBXs8Y0eqD6ZO
         clJw==
X-Forwarded-Encrypted: i=1; AJvYcCXvx+AdOj77eAoI5x6OHKmdxR3DEH2Ud+18+q6Z65eT6sDEnOFFVvwC0C1rg7HrOXfuSLumIU6lbjU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+xxMd7UfsniytXd4MuhBYDScZvu3HoQYCVEWTYIxpN+mieYyo
	AwM3NMXashvBbwXhPpcBKwbCmK4E/Ila3G8zgD7oU2u6HW0Op/RpQNuT
X-Gm-Gg: ASbGncvjdwGzqqLMDVjPK6b1Uyyf5bXAjZY90cgU8qJBlv0lvkG8bmTxHto5Y5Zdsz4
	5tpJk3/wRCeVy55J8dDtblA+Es9v6Giv0l9xnR5HDojWvcwk8aUzsrgR3DNycjuuea0VnX+49Yd
	zlIJrJEZsI5spIS+v7GHxVE611uzalvk/jB2wSg74LsXdHdv1QLo3RXvLbcy+fZOKt0K1tsRrvg
	sNWa74AoYM/y0AYEBJdJyefF/pgA/qQaDFOtoUy7BTZVHPKaaxK/UlCQ+Q/37NtvV7L5+Sw82yC
	femYFLvQehxU10WvLIDOjDBis26tB0mx/MuJUM77ZjjcBHsxm03qpd5w7KAm0k3sX1ovaljR
X-Google-Smtp-Source: AGHT+IFpUDfUnAX2UgOaYtx5HzKaH5jUInr4mRBaQC2SBRW2eEATOYyrepRrwBSGs68CpIz33VaPtg==
X-Received: by 2002:a05:6a20:c704:b0:216:1476:f5c with SMTP id adf61e73a8af0-2207f26b128mr8407327637.25.1750911731261;
        Wed, 25 Jun 2025 21:22:11 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34c4473133sm603181a12.59.2025.06.25.21.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 21:22:10 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 89F9B420A9A6; Thu, 26 Jun 2025 11:22:08 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux i3c <linux-i3c@lists.infradead.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] i3c: Fix i3c_device_do_priv_xfers() return value list
Date: Thu, 26 Jun 2025 11:22:01 +0700
Message-ID: <20250626042201.44594-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1573; i=bagasdotme@gmail.com; h=from:subject; bh=D8ChxclC0OryM1PIeIikl1ZBiXQj8Htj1KJRs3ZTtGg=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkxJ77vup0eNP9aXJ2wbvTbI7Pq4mce+bXyxuuvFULlk qf/rEzT6yhlYRDjYpAVU2SZlMjXdHqXkciF9rWOMHNYmUCGMHBxCsBE2OQZGf7/e7Mstn7yZstE B8UO/o4vU9JDbs1W/dZQYrpuTkB1dBPDP9W3be5XLnuFbXlwfuef1XsOyLfpSOYW/z+68mee8qH P2twA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_212212_149349_0143ABCC 
X-CRM114-Status: GOOD (  11.49  )
X-Mailman-Approved-At: Wed, 02 Jul 2025 15:04:03 -0700
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

Sphinx reports indentation warning on i3c_device_do_priv_xfers() return
value list:

Documentation/driver-api/i3c/device-driver-api:9: ./drivers/i3c/device.c:31: ERROR: Unexpected indentation. [docutils]

Format the list as bullet list to fix the warning.

Fixes: 0d2596508201 ("i3c: Add comment for -EAGAIN in i3c_device_do_priv_xfers()")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/i3c/device.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index e80e4875691467..205fa5066387c8 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -26,11 +26,11 @@
  *
  * This function can sleep and thus cannot be called in atomic context.
  *
- * Return: 0 in case of success, a negative error core otherwise.
- *	   -EAGAIN: controller lost address arbitration. Target
- *		    (IBI, HJ or controller role request) win the bus. Client
- *		    driver needs to resend the 'xfers' some time later.
- *		    See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
+ * Return: * 0 in case of success, a negative error core otherwise.
+ *	   * -EAGAIN: controller lost address arbitration. Target
+ *	     (IBI, HJ or controller role request) win the bus. Client
+ *	     driver needs to resend the 'xfers' some time later.
+ *	     See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
  */
 int i3c_device_do_priv_xfers(struct i3c_device *dev,
 			     struct i3c_priv_xfer *xfers,
-- 
An old man doll... just what I always wanted! - Clara


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
