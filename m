Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11037CD4958
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Sep 2023 05:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G67bNzin6zTGMPrJoD21Vp+v17tuMWnxmnzNnSYtNtY=; b=Kg7WlakkbmL5WH
	BpCHHrwuRLixz0ERm/XwPLxJghSwfZdNAI4llSaKDj3N1VT4JqDhIk9QD8gBNAiy1B9YsYNWA5hX0
	TF9xMW8bqV0DVYtvQZDxKuzrcK1eFeBQJds8LqG3JmQO5sRTBzUxuuNLbcm7LSj50VTzGS1rLfdXj
	uc4LwmLP61Vk3xvpTddvF9WR+QsbJfvxlr3dDCCsjgUEwfeq6riy0ti3gpZrV1Q2wHrHR70Kxvx4H
	kdKeah4Ay80/ec5wSrDQ9XPWbNl0VUBZ0AeCr59XrIsUPvL+tYvAl+g2qX6Hrsp9hmwunjVasAt/o
	+nD2rkHx0W5g+OZVQk1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChU-005DrX-27;
	Thu, 21 Sep 2023 05:58:08 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChS-005Dq5-1M
	for linux-i3c@lists.infradead.org;
	Thu, 21 Sep 2023 05:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695275886; x=1726811886;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0SpDm6JAqzdnGb98XVXF0fEr2pRDWo0lXrssUg7yu7o=;
  b=UizzP8a3uoIIK9zNzqzhym26eVz36lKOVRG97zzvCL1z6BQZ8LNIbofZ
   RyAN08ZZRXsjV0LhbtvSJ5wKIxxwQFIdAGSK23HDMgqFEeCi/at5g2n64
   39Kv3LtuW6Zi9LWxxwuwuj4eit2kDbPPEBZGpX2oCK0rRBeCGZJsuUGeL
   V1fzH15WpMPvNg0BzbEMLqnOAJ0Dv0hTNoMOmAxdTGrCJ8RkDsdqJczrT
   h0Lq6NTJMo9P5uLKtXEglj8kSlU+MP8DL/9c1+QlpxTY/vVNhSV5yXQht
   UMx6mup1T13OtrYe1ckKFuPYgnzFJ2gqQFM1VNNmgJpnGoCTbj4utPkdz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360678482"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="360678482"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 22:58:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="1077771255"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="1077771255"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.152])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2023 22:57:54 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 02/12] i3c: mipi-i3c-hci: Add MODULE_ALIAS
Date: Thu, 21 Sep 2023 08:56:54 +0300
Message-Id: <20230921055704.1087277-3-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
References: <20230921055704.1087277-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_225806_490340_07891172 
X-CRM114-Status: UNSURE (   9.72  )
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

Add MODULE_ALIAS() in order to be able to autoload this driver when the
device is added as a platform device from another glue code driver.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 837af83c85f4..8f43ad81fbfd 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -787,6 +787,7 @@ static struct platform_driver i3c_hci_driver = {
 	},
 };
 module_platform_driver(i3c_hci_driver);
+MODULE_ALIAS("platform:mipi-i3c-hci");
 
 MODULE_AUTHOR("Nicolas Pitre <npitre@baylibre.com>");
 MODULE_DESCRIPTION("MIPI I3C HCI driver");
-- 
2.40.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
