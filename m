Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73786106ACCB
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Mar 2026 16:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:MIME-Version:Message-ID:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6TrIZuc6sFgJqX6CYC9vRXVCjOElJ/86/SIkrlQ/Ch4=; b=b6Xy+PHm8H6f+o
	4HIE97EUL0jXfDR5cYXW9rQFiTVS4pa6S93tyOYgJ8CbhY4PXuRKzNyBWxQs4hX34AHdY5HyE1Q4c
	CHDZbsso0UD7VP+bq/Mt8LLl3TIeFcDDn2oQtCW/raIAgOyxGTuBdEgji7O9EtFfUOfeoTWh+SRkx
	5f+sqxjNByH6txlDbzO2KAPg8qscnp7e+9Iwp/4seAwbgCzBfqOCC2suuwXk+b9NKb0wlc3q7g+30
	rXaz0QP1G/QVE+0bqj/pOA6n/t6LuI9F4PZKA4fZATzVS4ofeB+qtTY6Oinh8qEv+NV/loUU2Q7u5
	tBNhajoKr4yoHs4NtQuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0j3b-0000000Eail-0JwM;
	Thu, 12 Mar 2026 16:38:43 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0j3Y-0000000EaeC-0Zda
	for linux-i3c@lists.infradead.org;
	Thu, 12 Mar 2026 16:38:41 +0000
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CFfoNR2906891;
	Thu, 12 Mar 2026 12:38:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=JCpv4WQ8L7NoSTzERSi131Lwt+X
	J5BcWkyT43nWz1qs=; b=uv07c/bkYWoud/fatftV6PA493EH9n4WJsjv9cMfdiZ
	QE8qo3YtFDglqe8gFCklza6ZxjRNv5rjTEpivp0MKhBf7NDb06OzbEAFUBL8JUMP
	HEa38EdSPozTu373YtOtproYS4qAQIDU+upA40ksikTv/umq0hZBq7XBHSimAQwL
	FU5S4/URdEMvcChQTB4BkO3zSv1Jhdr+cRWWGOq++t9D7d2+p2m073fNHOQPqaHk
	O7511/pKuRC8p8EknwK7lnKFCUpLum8zHHDzJ5/Km65aZbKfYbzOgYgrSsEUhbxj
	Co2ILzIfpIjBrkgOrTIWeQKm0baMdwkDgHiCEry3arg==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4cuh50uhdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 12:38:24 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 62CGcNOb009185
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Mar 2026 12:38:23 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 12 Mar 2026 12:38:23 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 12 Mar 2026 12:38:22 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 12 Mar 2026 12:38:22 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.82] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 62CGc8GX021063;
	Thu, 12 Mar 2026 12:38:11 -0400
From: Jorge Marques <jorge.marques@analog.com>
Subject: [PATCH v2 0/5] Fix paths unexpectedly returning Mx error codes
Date: Thu, 12 Mar 2026 17:38:03 +0100
Message-ID: <20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOvrsmkC/32NQQ6CMBBFr0Jm7ZjSAlZX3sOwqO0AkyglLWk0p
 He3krh1+V7y398gUmCKcKk2CJQ4sp8LyEMFdjLzSMiuMEghO6FEi8Y1opO4+MgrJ0IKwQcc+IX
 OaqWsk4PQGsp+CVT03r71hSeOqw/v/SrVX/ur6j/VVKPAk3TKtvIs7o25mtk8/Hi0/gl9zvkDp
 Y1Rw8MAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773333488; l=3204;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=pttvBE1RyXMXHObe2PbEoTmlqOnS9JslcCMhhN6A85k=;
 b=fFNtHLqhtYQP/bMZwaWmNjeO4k2BecoIE2vtSvw5aA/ke6e0zyOYXKNQ9b3+4epa9EMfOc36a
 HLjHQ4FWWpvB1oiMpH/6pJkGIMPYLULt7Q3WZqkOpl3y9H0+R70TsDz
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=RsjI7SmK c=1 sm=1 tr=0 ts=69b2ec00 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=2cd5jzKCDDM3a5ddEsEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ZUhTc8-iU0mtx9VyNm3TWxSO9j3JZwVb
X-Proofpoint-GUID: ZUhTc8-iU0mtx9VyNm3TWxSO9j3JZwVb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEzNCBTYWx0ZWRfX/ADT5pAkfGOK
 AVTn9YW4LO71XjsaqjTaeExutwtNLPn/imm6JXUYsGjn251YMG6blmSh+fuNjOrUHLjk9Ndqplv
 BvRvUJVB13Juq3yNQGV7dSQ6Fby51lsV/2Zm6HYgKuJorW3vNL394myBRluX4qu9xXS4cJCFgr/
 VXizxqqSQRTJJY176NGJuZNvxxsPTNAjJNaJEqe6pD5mXOo15nVkjP7HfF+kWoI0CPFPnMfHXeA
 mWWyBBkkrFHuKySNvHmEiflV3ISOJNuYSETxJzMGbwystCX1oKw/aoRshEYqMMJmBEbvDgbYG+Z
 19ldcRxvWMptVZU5XME2UUlna3ocEky5dIqecgmrNOsGMPHU16e2zeTo+wiAbVMP+75hRYPhE0X
 baEfVujfg4tPOmL1PdGgX/otwQrjGHUOtBkCJNm2JjE555GenUYn1CIo48HhaA+PfYh6JtBHn1A
 +y84BCdVYuRNbgzL3Qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_093840_183727_340AB4FE 
X-CRM114-Status: GOOD (  14.78  )
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

 drivers/i3c/master.c                 | 67 ++++++++++++++++++++----------------
 drivers/i3c/master/adi-i3c-master.c  |  5 ++-
 drivers/i3c/master/i3c-master-cdns.c |  2 +-
 3 files changed, 40 insertions(+), 34 deletions(-)
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
