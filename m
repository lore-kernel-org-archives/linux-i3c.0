Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F31EA8535
	for <linux-i3c@archiver.kernel.org>; Sun,  8 Mar 2026 16:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:MIME-Version:Message-ID:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q8xDduyKzUivMFCrgBojjnpWvl2ph4BU0oI4HIQXzE8=; b=DexWVK4ia3/mCj
	Jle9zNBBzHBVWwDT9o/LFel8qtfyzKhtkxvooKGc5EjkJBEPvER1KJjdGLjEary437q6tHUjSNSCx
	wtbnktwZK9anjGBLu2JeQ6DdbWchzLwmlbxBKU301eEdJ4KVWxHhS6h0vZeS+Ft6txGJprYs4eYXj
	ZYrFTOxGpLw8gzH6Q7PhpwiVPobSBsKEb2ngF2e8E4H8sxQxcPg/DE3za3pXmOqtZl6n0Onv9RRuj
	OwQ0/y/TPLuN5nCo4FTLHJXAweYrqAosycnVWFsMXGHtZvGGulx+XDBska7c7o90Cr2zpKGrh2wC0
	h593XACw2lkyPOX+OUyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHIo-00000006Bqq-2rNF;
	Sun, 08 Mar 2026 16:48:26 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHIm-00000006Bpi-0d1T
	for linux-i3c@lists.infradead.org;
	Sun, 08 Mar 2026 16:48:25 +0000
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62888aLJ1053727;
	Sun, 8 Mar 2026 12:48:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=8hLYNwAftzdI9FuD8Ko92C6GIjq
	rQbHkr6NtUx5cZfg=; b=ZGx01Lr6RjhEIMNhUKWBq0RFPiHxHRWh0592TZedOV/
	3Yf0Pe5yViGJm9PVWEj9ffVBsZ8RaQh2zHx53bgxkB2bBTiHXMJ09z/aJJbY6Yr3
	NvHxwirpewrFITOYPjI34dBf3Xr/gmXa6XJP1QhgUPh5OaFg2QgnVPMv5l+6YvvH
	ipKQn0Fo6I8r1X7uj+//8kLqpiklFFwdICQdPmaJdYCRmS7d4n+T4URNQ8STOdRC
	WE3JJZbABvLmR66JqNtwconI66/IRHnKg7GiOZKoBdI+fF1fvS/qIByVhtjozdoY
	JhL2eFRLAhbKh4Yq5ptKY/3kmLnlA0SpBJxOuGX+1+g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4cs5bfrxcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Mar 2026 12:48:05 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 628Gm4fi014360
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 8 Mar 2026 12:48:04 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 8 Mar 2026 12:48:04 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 8 Mar 2026 12:48:03 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 8 Mar 2026 12:48:03 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 628GlhfG003692;
	Sun, 8 Mar 2026 12:47:45 -0400
From: Jorge Marques <jorge.marques@analog.com>
Subject: [PATCH 0/5] Fix paths unexpectedly returning Mx error codes
Date: Sun, 8 Mar 2026 17:47:36 +0100
Message-ID: <20260308-ad4062-positive-error-fix-v1-0-72d3c5290b4a@analog.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACiorWkC/x2MQQqAMAzAviI9W6ibyvAr4kG2Tntx0okIsr87P
 CaQvJBZhTNMzQvKt2RJR4WubcDv67ExSqgMhsxIlgZcQ0+jwTNlueRmZNWkGOXB4J21PphIzkH
 tT+Wq//e8lPIBiC64rmsAAAA=
X-Change-ID: 20260305-ad4062-positive-error-fix-dc833cd2f088
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>,
        =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Dan
 Carpenter" <dan.carpenter@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Jorge Marques <jorge.marques@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772988463; l=2415;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=CIxlwxSbhiSUx7l1qJcFdwhG67qFC0s0MM/yxICscI8=;
 b=mMyhWQo91nWzBy+4nXpfGURPsiT/F0iNbhaDNY0m4pW9/3PREJoBtr6TUEbcHysGTJcp1BMGD
 wPObDCBwsyuDL+Yz7ufFGPSpB9cMOnKn9N3oZvSfgOVTzRYVhskqqpm
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=IP4PywvG c=1 sm=1 tr=0 ts=69ada845 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=Bb9UW7Itd6n9W6UHIQgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: LY42tQhiB_AOYI2VLiUQ10_gHPI2xu1V
X-Proofpoint-GUID: LY42tQhiB_AOYI2VLiUQ10_gHPI2xu1V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE1NCBTYWx0ZWRfX4jEM8AUY32WX
 MUka07G1/bnYpeIfGQkyVXA+0y7J5aLiBy4wQk+olb2TrDYQg4QqvcuF2GcUW1C736A898h1tGr
 EK65zZc5dhH5V4tI1uuHBFkpuOa+OWaF77OeCWBaVZ4zm9o768FER++2xByEeEd8baNQQxAD8Dv
 roi7JEnrJ/61lz+5OeuNmjB2RcouTkXoZzp5fjS9XMCocsng15pe40zXwVATUT1CYKrJJPKpkJr
 /jJYwyS4PjOcQ9uQEh9y97Erhi2VPjeiBm1wMIUodF9Ost8376/SJOhT8Kw+SPpJyPWK5uzZiBb
 CE5/8pBBqdDoWdbbV0hfJ55BNNdQacy0eT9VQQOvl9ew/6TTChJ7DRl0YN7UYKifYvJkLZYPRrt
 i4x35NlcCJWbLDKpsG40f6ooikkgDXKOnvjfFzBMrP5602aowz2Ps3AekZppRMwn0syutffg71a
 CNlfRtqMG2o/AqJXcMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603080154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_094824_197984_28146D37 
X-CRM114-Status: GOOD (  10.72  )
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

A smatch warning on the iio/adc/ad4062.c driver raised that many i3c
methods that documented returning "0 on success or negative error code"
but actually propagate positive Mx error codes (I3C_ERROR_M0=1, M1=2,
M2=3) from i3c_master_send_ccc_cmd_locked().

Close paths returning positive Mx error codes when 0 for success or
negative error code otherwise are explicitly stated, ambiguous or
expected.

If any Mx error code is present, for each controller:
- adi: returns -EIO
- cdns: returns -EIO
- dw:
  - RESPONSE_ERROR_IBA_NACK -> I3C_ERROR_M2 : returns -EIO
  - RESPONSE_ERROR_ADDRESS_NACK : returns -EINVAL
- renesas :
  - NRSPQP_ERROR_IBA_NACK : returns -EIO
  - NRSPQP_ERROR_ADDRESS_NACK : returns -EINVAL
- svc : Unclear ret value, but cmd->err = I3C_ERROR_M2 for any ret

Each i3c_master_send_ccc_cmd_locked caller handles cmd->err directly.
There are three exceptions all related to the bus initialization:
* RSTDAA -> i3c_master_rstdaa_locked
* ENTDAA -> i3c_master_entdaa_locked
* DISEC (broadcast address only) -> i3c_master_enec_disec_locked

For direct enable ibi, disable ibi to a target, error code M2 should not
be suppressed, the device must acknowledge it.

The patch series start with moving the error check suppressions, then
does the actual change in i3c_master_send_ccc_cmd_locked to return
0 on success or negative error code otherwise (drops the positive Mx
error codes). Then ends with returning the xfer->err at
adi_i3c_master_end_xfer_locked.

The series was tested with adi-i3c-master.c and iio/adc/ad4062.c.

Link: https://lore.kernel.org/linux-iio/aYXvT5FW0hXQwhm_@stanley.mountain/

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
Jorge Marques (5):
      i3c: master: Move rstdaa error suppression
      i3c: master: Move entdaa error suppression
      i3c: master: Move bus_init error suppression
      i3c: master: Negative error codes at send_ccc_cmd
      i3c: master: adi: Return xfer->ret at send CCC

 drivers/i3c/master.c                 | 62 +++++++++++++++++++++---------------
 drivers/i3c/master/adi-i3c-master.c  |  5 ++-
 drivers/i3c/master/i3c-master-cdns.c |  2 +-
 3 files changed, 39 insertions(+), 30 deletions(-)
---
base-commit: df8d8e0a9edaec6f1083870f8fb6724e9c663508
change-id: 20260305-ad4062-positive-error-fix-dc833cd2f088

Best regards,
-- 
Jorge Marques <jorge.marques@analog.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
