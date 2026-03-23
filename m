Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0CFF483C5
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Mar 2026 16:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:MIME-Version:Message-ID:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mp034u5aO6erq8vPv+uYmYMGCnnKZEw1AQh74PjOayM=; b=vcZa29AVskgzRw
	sxYWSURh7LVahmYl6NA32bigH/kgEUfOwrGhHNF6VAv8BN/VZyIToHavWxSRMf/QiusLkIqm0U7bC
	hkZakmoFa885rUl6mzro6t3+5bycM8WASFARvTFoBzW+Y9m/YlM/Q/nbtu1+ejTsRTWF9ZGlMi7mV
	QCP6X/Mx4G5sgdWfPquo8wTdtwZoZW3gdZ35lHzt77XabkKIadZc/xrGLVNSEpcWC/FFcuTuAFJB5
	LnGYWOz49U9JonRgqBOg7R2ieI2CHUmdqI2DbldPzjKZwSpESY2OvHInGq3p2wAOFG0bsflFFn8Ka
	vysdF7K7YoOkg2Pbj68Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hsq-0000000H6IU-1Kmn;
	Mon, 23 Mar 2026 16:12:04 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hsn-0000000H6GI-129C
	for linux-i3c@lists.infradead.org;
	Mon, 23 Mar 2026 16:12:02 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NBnDSx662680;
	Mon, 23 Mar 2026 12:11:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=R09iIYf3oxmEwWQC+UpQhI5W3FC
	CWVVOn4REeCW/FFU=; b=v4n8VGbDcy1/UTTa2Fe+arOoC+l2UjQbYuGqWWvzWxT
	7sdulFmerMARZRAkzdCZfgs9tsCwpG97fW6wXc9Bj8OPkv2mPdn4UggVvsivGa9x
	GSa7me4eD/5mzyKltwJmhshjUm940MVh/v5xDXGCCbbes/sHtU3elTGhXJwZKoM2
	rlhP+9EmVfTU6v4Jnp3xpN7Kn7TMshHOv/FetX+BGYT+TWMQPl/WNpBZdom6tmeH
	m58t3bml5tcEFBPlGoV1gESQ6HkvzFGgqetYPM4PvzF6lvqBPbR61OrsrProU8/I
	I98Jyt7ecuAXBOWk+BFN8UuuVaK8PdwfWLeCMiNIPPQ==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4d1n620ct4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 12:11:49 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 62NGBmgr044693
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Mar 2026 12:11:48 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Mon, 23 Mar
 2026 12:11:48 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 23 Mar 2026 12:11:48 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.69] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 62NGBYnq019356;
	Mon, 23 Mar 2026 12:11:36 -0400
From: Jorge Marques <jorge.marques@analog.com>
Subject: [PATCH v3 0/5] Fix paths unexpectedly returning Mx error codes
Date: Mon, 23 Mar 2026 17:11:28 +0100
Message-ID: <20260323-ad4062-positive-error-fix-v3-0-30bdc68004be@analog.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADBmwWkC/33NTQqDMBCG4atI1p0SJ/7ErnqP0kVMRg20RhIJL
 eLdG4VCu3H5fjDPLCyQtxTYJVuYp2iDdWMKccqYHtTYE1iTmiHHigtegjIFrxAmF+xsIwF57zx
 09gVGSyG0wY5LydL95CnNu327px5smJ1/769ivq1fVR6oMQcONRqhS2x4W6irGtXD9WftnmxjI
 /5QOR5RmKhcN0K0pa7JyD9qXdcPSFne6Q4BAAA=
X-Change-ID: 20260305-ad4062-positive-error-fix-dc833cd2f088
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>,
        =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Dan
 Carpenter <dan.carpenter@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Jorge Marques <jorge.marques@analog.com>,
        Adrian Hunter
	<adrian.hunter@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774282294; l=3621;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=Fr5T7pnW21riwLA1UYRze0WeDtRxjtowEGHqOT7FLUw=;
 b=2PQXCJUnt30c9d0GZpiwwepawF4h4v85IszfwXvXs+Lc6OfBShVVZDEAQM37ELKvfcvrUKqOD
 p+cmXatNu0xBH8joBU6QkfqOGHzKQcdmkarMT2K/NpiQYLKtiya5Cdb
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyMyBTYWx0ZWRfX0sY29CZKsvdd
 tf8ViGAqSszUZBAdBjunchdhaR3EP2lrFBy6XRpjlHA2n1D+ymhxkAAErclVLpGW5xR1N6NBSGo
 4DAJTbWuLYqB6lo2oWPlVx3HN3ARwM8xZCsnTNl/qnZI9Ia0kPh1n+cK2BnVy7kB1dO01+qvieq
 R1gkH8eXxUS3Y8t4i3gyCO3d44CIS58ZMLHhrBP+j7Yub+4BW0n+URcdJvj94T3XeZjk2hxb/MQ
 6mmM8c0KuiNylk1mjKq5mrsalUJ66i8/OlnS8AQLOxZcy9fMwBwmMfCrvlUrGKJc+dQa7IGDYH7
 EE3THdaVKVLTYwxi2hi9cGNnCINKs/lfX9JfBf+plFi1KEhr6NKUlzw90bxqOoVItA/xaoGhIKc
 t7xMsDuzJx1PygmdHEAegi4YAfTD0iZvE1umKYDQpNsEz+pAptU+KS3S+LDKLrSjKHgMXpg1+fa
 Bej9rF+BrLVSUwzCdUQ==
X-Proofpoint-ORIG-GUID: kSTRJW3jTpvhb4N5Wdjpn2UgrKr-Bshk
X-Proofpoint-GUID: kSTRJW3jTpvhb4N5Wdjpn2UgrKr-Bshk
X-Authority-Analysis: v=2.4 cv=D59K6/Rj c=1 sm=1 tr=0 ts=69c16645 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=2cd5jzKCDDM3a5ddEsEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 clxscore=1011 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_091201_315462_D91EF0F7 
X-CRM114-Status: GOOD (  15.88  )
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
Changes in v3:
- At mutitple commits: 'Prepares to fix' -> 'Prepare to fix'
- Remove no longer needed {}.
- Add () to i3c_master_send_ccc_cmd_locked at commit message.
- Fixup commit text wrap.
- List the titles of the prerequisite patches for the fix at the
  "Fix error codes at send_ccc_cmd" commit.
- Link to v2: https://lore.kernel.org/r/20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com

Changes in v2:
- Restore rstret to continue to do_daa on any RSTDAA error.
  Note 1:
    This patch also solves
    mipi-i3c-hci/code.c@i3c_hci_resume_common returning positive error
    code at dev_err, since the Mx error codes are not propagated to ret.
  Note 2:
    It is safe to do the DAA again on devices that lost power
    (hibernation, ...) but already had the driver probed, since the PID
    is unique and i3c_master_search_i3c_dev_duplicate() searches and
    recovers the previous instance.
- Update the commit messages to explain the commits that prepare for the
  actual fix commit.
- Move premature method return documentation change to fix commit.
- Link to v1: https://lore.kernel.org/r/20260308-ad4062-positive-error-fix-v1-0-72d3c5290b4a@analog.com

---
Jorge Marques (5):
      i3c: master: Move rstdaa error suppression
      i3c: master: Move entdaa error suppression
      i3c: master: Move bus_init error suppression
      i3c: master: Fix error codes at send_ccc_cmd
      i3c: master: adi: Fix error propagation for CCCs

 drivers/i3c/master.c                 | 70 +++++++++++++++++++-----------------
 drivers/i3c/master/adi-i3c-master.c  |  5 ++-
 drivers/i3c/master/i3c-master-cdns.c |  2 +-
 3 files changed, 41 insertions(+), 36 deletions(-)
---
base-commit: abaa7682a784a0ba4ddebb08a46ed8b76859d1e6
change-id: 20260305-ad4062-positive-error-fix-dc833cd2f088

Best regards,
-- 
Jorge Marques <jorge.marques@analog.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
