Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B53C5ACAB
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Aug 2026 14:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ilsHhpyh95LhLQrkvzhedAqfTOHZmmEIgBloJxbICJs=; b=QxLSDEyifufJSq
	fzEoKGpxzgkah+0BNEcWbAE0gFL+nYVGfIFWm6jUygv32x5W1VMhuEKALgY8RbT9FxUBwlWAaRJ6w
	1O/V/pmrjzgirBU4l7GcgF3j0lm3qVb2m/T4l4hA5uSHXb68G0WDGnzMrSiz7OS99skphAVyb9HuZ
	KZAZ6umuh671p4akjwqLdUmcslkFKLI/AAiALAWilfA4voKNNh/camUmSpR59dUl+SsqjIP+Y6Q6K
	aSQhSKM7xVl5TKE9DAOBhSlNGcPh8mZM27RsOHistO4y6UbJRuEluytvl2t4keA6UBJanih1bNsWM
	pF1K83WuW+q0e4qZdBTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM0x-00000008IlK-06h7;
	Fri, 07 Aug 2026 14:57:39 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsM0u-00000008Igy-36i8
	for linux-i3c@lists.infradead.org;
	Fri, 07 Aug 2026 14:57:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786114657; x=1817650657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Rl+Rgm264AjO8qM07awhvbwkMrjgpE41Tf0eFaZ47E=;
  b=Tga+gBkuA9cNxTz/DGz97g4L7/Kj648U8VQ2rUb8LHz4U+8RzazG1tzg
   Tfe4cA+PJ1EcWGKiiU7yKUSE+ifykLWZkBmqXGZr0oTI+tbcY6myLUOxX
   TBqHx4iKoi+hJRD1IOOwmNz/QfKY9/Ae3MUP9Et8GA39aaZhcq50VsBjj
   Ppi9esfOEtisR8LudSU9HL3Jf1+gowPX/3d09ORXX2RliwF9V5eaFf5bj
   xyUOlH73mJuXeTuKpVe4S//IHQ1di6k4VkKZ1Ulpp+SfDZIDtlVIUkavV
   IbVALaeN1yKKwdPq1FnBFx1Tl/eT5KMCCgx+3vCK8BeY5nqU+9lgylt6b
   w==;
X-CSE-ConnectionGUID: cxcw13aCTLek1g84BTRN7Q==
X-CSE-MsgGUID: EfgqcOasSOKiyht4QVzsWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86485219"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86485219"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:36 -0700
X-CSE-ConnectionGUID: /JuiAGbPSRqY0HkiARNztw==
X-CSE-MsgGUID: EIcZxlcATkyr+d3TASXtoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259809896"
Received: from amilburn-desk.amilburn-desk (HELO ahunter6-desk) ([10.245.245.114])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:57:00 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	akhilrajeev@nvidia.com,
	mukesh.savaliya@oss.qualcomm.com,
	rafael@kernel.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH V5 05/14] i3c: Make dev->desc locking assumptions explicit
Date: Fri,  7 Aug 2026 17:56:29 +0300
Message-ID: <20260807145638.168865-6-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807145638.168865-1-adrian.hunter@intel.com>
References: <20260807145638.168865-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_075736_827190_0FED0CD4 
X-CRM114-Status: UNSURE (   8.11  )
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

i3c_device_get_info() takes the bus normal-use lock before accessing
dev->desc. Under that lock, the descriptor pointer is guaranteed to be
valid for the duration of the access.

Remove the unnecessary NULL check on dev->desc so the code more clearly
reflects the locking rules and expected descriptor lifetime.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V5:

	Added Frank's Rev'd-by

Changes in V4:

	Added Mukesh's Acked-by tag

Changes in V3:

	New patch


 drivers/i3c/device.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index a3778282e84c..5e6df6de0283 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -101,8 +101,7 @@ void i3c_device_get_info(const struct i3c_device *dev,
 		return;
 
 	i3c_bus_normaluse_lock(dev->bus);
-	if (dev->desc)
-		*info = dev->desc->info;
+	*info = dev->desc->info;
 	i3c_bus_normaluse_unlock(dev->bus);
 }
 EXPORT_SYMBOL_GPL(i3c_device_get_info);
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
