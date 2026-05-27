Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BB2CD5BC9
	for <linux-i3c@archiver.kernel.org>; Wed, 27 May 2026 11:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YgKeJxFQRHnPySBpQX4ocVVFuT6CjjZOjCTNos7ADqU=; b=0yYJ5D3aIATd9i
	WEIldR3SdXnTD2N1vMSaZ2jduooir23Csn5wAGNXNJNKRUQFCodceMloB8/xqovsuKQgrTwNhIh46
	/BHC0Rb7Izj/l3JoKRX54cuxuJDzDgHCfrvK4AbzJz847JqOaePVglsX37/+R9vCjkcM+8nboewR4
	XNIGGb3AelC1LsydmGXC4BkuYBN1j/SypaAREO0er7YcpB+AiAmSzJNu9fjX0HxMzE2Di40E8Hfus
	jBUf8ulwfnpMcZRgWy/0PwKVgteAAoCwZKxqktWo5BaFeMCQWahLCPhhk+B+zM+aSYcdU3etTJxnU
	KAPJ/DM4IViEOzGxkRfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSCQr-0000000409j-3zFA;
	Wed, 27 May 2026 11:28:17 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSCQp-0000000407g-2qvv
	for linux-i3c@lists.infradead.org;
	Wed, 27 May 2026 11:28:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779881296; x=1811417296;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k6p0xK704uGOe3/KyowiZtFfm7nEdmde+AjkTtVBzWE=;
  b=VAHDBtC1hox5BdA1zN2kvjXtAdl0/RhNL2La3OVy6zRdz5wOBU1rn42r
   UlRpvoVW+DBWISy1rHq6Q4/y4GyEBAYKh8bCaPxMS3SqlKhSoTTzudaOL
   aaYa1z2UUe4kZot31tWngdzK2YhBsLGCH7Ishu2KA14kOO1FDz4MnEeys
   UO7Mr7lXd2+D5LD/w72RM4xKLcO9nuK0hIN0y4U30oqo2vsGcs3he0mG8
   gAR6CEcGDg4UiiLexugqzkNi7EGLWohYZgZdd0Yd+5RRO2QtIpV9uHiBK
   CIdI3LRAqkTvWdtSZD0zDhHFV6eJNHy5UI+34MWucelx/C7QCOdBOG4uw
   A==;
X-CSE-ConnectionGUID: 8KSnVZ93QZGGKw0DzOfDKw==
X-CSE-MsgGUID: k7XHaOiIT5uLUEiSfD9eNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="103381717"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="103381717"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:28:15 -0700
X-CSE-ConnectionGUID: C/YsFEH1TeilFsWxfzLWcg==
X-CSE-MsgGUID: 9IISkzPOSS6iIUmeALVCAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="246238613"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.228])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:28:14 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] i3c: master: Prevent reuse of dynamic address on device add failure
Date: Wed, 27 May 2026 14:27:54 +0300
Message-ID: <20260527112758.38530-4-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260527112758.38530-1-adrian.hunter@intel.com>
References: <20260527112758.38530-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_042815_809274_7E1F0AE4 
X-CRM114-Status: GOOD (  12.58  )
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

i3c_master_add_i3c_dev_locked() is called after a device has already
been assigned a dynamic address.  If the function fails, the address
remains marked as free and may be reallocated to another device,
leading to address conflicts on the bus.

Mark the address as in use even on failure by updating the address slot
state to prevent the address from being re-used.

Emit an error message to inform of the failure.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 drivers/i3c/master.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index f87bf0099d3c..7820f58ab4aa 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2345,12 +2345,9 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 	bool enable_ibi = false;
 	int ret;
 
-	if (!master)
-		return -EINVAL;
-
 	newdev = i3c_master_alloc_i3c_dev(master, &info);
 	if (IS_ERR(newdev))
-		return PTR_ERR(newdev);
+		goto err_prevent_addr_reuse;
 
 	ret = i3c_master_attach_i3c_dev(master, newdev);
 	if (ret)
@@ -2472,6 +2469,14 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 err_free_dev:
 	i3c_master_free_i3c_dev(newdev);
 
+err_prevent_addr_reuse:
+	/*
+	 * Although the device has not been added, the address has been
+	 * assigned. Prevent the address from being used again.
+	 */
+	i3c_bus_set_addr_slot_status(&master->bus, addr, I3C_ADDR_SLOT_I3C_DEV);
+	dev_err(&master->dev, "Failed to add I3C device at address %u, error %d\n", addr, ret);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
