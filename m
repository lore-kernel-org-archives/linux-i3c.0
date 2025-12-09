Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CD0D3B7F3
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Dec 2025 11:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9MyJ5BByAexv80bXtw6mF4Hy8VAPCd3Hr7F06WrqSo=; b=XCm0OdkrvWr+PT
	1K5gs1vhOW4CsCzvhPMQ7WX9n4IG7NJK7rGxcXHf26l8tm119fYZm1xA9rh55+Z7y2NC7d+JVyN6f
	Ueg24J72bwL6fn+V12TJmXgh88Fe/+IOy47v9gBNXV44YLLabNzuwLc+ExlbiTcCi/rgzaD/BA+V2
	ZLtwmTIQwysRLciaormNA3Gq8md3rK/ae4BG9QkrXVN63C8AfoZSO0bjqO6/hjO7d14KOg/Dcldwc
	CWhIM+RrIcmb/glf/vwzTLiE7kbNl6umSvNdk7z5EWWN9jeuAsMXRZgNt4bAOjBJrk+IcWmla1Qkv
	dm45tVQyGxooefo0x3Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwFT-0000000EDKW-1icS;
	Tue, 09 Dec 2025 11:51:19 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwFR-0000000EDIC-157s
	for linux-i3c@lists.infradead.org;
	Tue, 09 Dec 2025 11:51:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765281077; x=1796817077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Krb3ohAXrWfqT4HlJBWB7QWHZuhJQy+Vd/KYLEgUShc=;
  b=IVEBzh4vglKGSl3OlhL64uJhNdml1VAnX89K8E9KTU6uRxQKAPOh6l1B
   VT2ub1RaPQp8Couu3J42o8fMy0XvZ5369UYrN0utpRD1r6RrpNOD2Xrzz
   SpQhsDkwepiT9xuyYpd2suWnjUBaNeBt67Ut8R+cLlBx6lLCBYkAuk9/6
   6c6/veUN4CwuR2HxIbZfSVGSgx+SbLJifiJiKF+7SXTepRh1IPFHLhdPM
   lHnS1rfTGBEhaVzLTIloaMB1GAKM9l8e6E5oVrS+qa8SqqctsXz4rpk3z
   c90eQePT/ArrrMhy8SZPyMUyjuS2zKrJHY9Du6jVPQVyvGl5vFpFNUKaO
   g==;
X-CSE-ConnectionGUID: lTLRdNJ5SYS98Zy6aFAg1Q==
X-CSE-MsgGUID: jkXRYeffR2uLknFJ+5/Dew==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67271165"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="67271165"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 03:51:17 -0800
X-CSE-ConnectionGUID: FYoSU0JFRoq27dlpEIiSbQ==
X-CSE-MsgGUID: 8Fbjvbf5SPy/IlHg7ch37A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="200644426"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.132])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 03:51:15 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH 2/7] i3c: mipi-i3c-hci: Stop reading Extended Capabilities if capability ID is 0
Date: Tue,  9 Dec 2025 13:50:59 +0200
Message-ID: <20251209115104.124156-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251209115104.124156-1-adrian.hunter@intel.com>
References: <20251209115104.124156-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_035117_341110_CB39075F 
X-CRM114-Status: UNSURE (   9.34  )
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
---
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
