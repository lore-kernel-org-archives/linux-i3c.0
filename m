Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA28D41C38
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Dec 2025 13:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zozPrz4Hrz6PGxacqrV0lTC7eEj9rNPkBm2+VbE+60s=; b=q2jq3LNNR6VLu0
	cBtvvsnAqaOxbSqjim0kLddBbACaaPQrV2Ylzeo0NL1wlWvo7gVlw370+CVY/OxegGCqEJPkoTR6s
	ZhCu/K/RhPKsThoVdiUivF674rOGGxduzHpOD7p6b3BUygA4bhuK0/h3pg6hSIPBuUbIHOJTV6CmW
	z+BKknttUNC7iKjdGNRd9K/ENnYWSmNvL/MbIjYyBOqq4OZxYsZSWUM6laChoco31yfnwQ75iLi8R
	/0g6w0XpgBOELne/suwLaZGptlITHN+d1jcirqOKz2zhxJGxmVTKwyPze9pj33bx2mO5x0+R8KXy3
	l8PmQCatRDQ5hBvchDeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh22-0000000Gfdb-0HMl;
	Thu, 11 Dec 2025 13:48:34 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh1z-0000000Gfc2-17U1
	for linux-i3c@lists.infradead.org;
	Thu, 11 Dec 2025 13:48:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765460911; x=1796996911;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GQ9VUxxcNLYLk5WQbPYudNpp4lIHdf59wpBDbAHVsWg=;
  b=V1a5Yo3rdFKCrrB6IC5ZnVSsGrKgWlzsrJxhagc8fW3u6f0ITqaZ4oyp
   UdQda/TnnBbOQmPUkMUffE1uWb0OF16zQ32AX5o+i81G7OaorMncF30/h
   S2Ct/8kzKmEy3I6XCxQKcVuxfyG1nO0IscuKc+9q6JkM8YNxgwNVGj744
   5jzyqLVqKPf1AoMX/m5OUCAAcih5eZohywilbOeK4hdd+WhUx06rsW4Qy
   VJB2jDl0Eoo/KoZhIr73FcbpqLQF59UamwaRQtyqmeOtqLrKsB9n6YYae
   jaQeqp6qjnuBOWBWf6iDaNE2MTJT31YJBYNewaCF56+bBxQekcyCuuneY
   w==;
X-CSE-ConnectionGUID: 4m03BB7YTIiv8IqGqMDEDw==
X-CSE-MsgGUID: QjEn3vWrTyCVN8lKoV3ZbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67481850"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67481850"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:48:31 -0800
X-CSE-ConnectionGUID: huZwLkkwR1GAfzcnEPz5TQ==
X-CSE-MsgGUID: oEiLOgaST2Kpn1vfZ6BKlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="220171664"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.164])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:48:29 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH V2 02/10] i3c: mipi-i3c-hci: Stop reading Extended Capabilities if capability ID is 0
Date: Thu, 11 Dec 2025 15:48:01 +0200
Message-ID: <20251211134809.75872-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251211134809.75872-1-adrian.hunter@intel.com>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_054831_319345_8CFF0AC9 
X-CRM114-Status: UNSURE (   8.93  )
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

Extended Capability ID value 0 is special.  It signifies the end of the
list.  Stop reading Extended Capabilities if capability ID is 0.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---


Changes in V2:

	Add Frank's Rev'd-by


 drivers/i3c/master/mipi-i3c-hci/ext_caps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/ext_caps.c b/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
index 40939af0b0e3..024bccf23fd0 100644
--- a/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
+++ b/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
@@ -271,7 +271,7 @@ int i3c_hci_parse_ext_caps(struct i3c_hci *hci)
 		cap_length = FIELD_GET(CAP_HEADER_LENGTH, cap_header);
 		dev_dbg(&hci->master.dev, "id=0x%02x length=%d",
 			cap_id, cap_length);
-		if (!cap_length)
+		if (!cap_id || !cap_length)
 			break;
 		if (curr_cap + cap_length * 4 >= end) {
 			dev_err(&hci->master.dev,
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
