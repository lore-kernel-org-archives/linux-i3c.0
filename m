Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83A9C7115B
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Jun 2025 07:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:MIME-Version:Message-ID:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EvDbp9uiTf7pv1ajh8PbQtodJONB5stBOcwIU2tJ4Bg=; b=FppTHmB80VAqTU
	i655Eu8eEh7OOywcEcAbowjPY/bSkew+aB1gv37NzSebTNG9Yir6qHRc08Bi6wrUfVZpNzBxbl79U
	1dwNruCn90EIV5GvDDL65Oxcira/Ef0F1DjSHaumjdd9ZrcmimTcvNjYyQPfrolD/mIJ6FZZspGlK
	7YMs4FldsFn7qcZt5yLrvIipXofCTwxTQwKJyleKjrDjlpHEgxmwsmXekSG3AmIa7SAwBmhFfLiyV
	BjZnL4hEqQmCelJHIPgaC4jtf3LPXuB8f3pnmyCMNlPVCsjqHIh63XNAoiyPLAKJAA7atUop4n3SQ
	xqQDhwsJIhYfSaVzMQDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRn2r-00000009H8v-2Oho;
	Wed, 18 Jun 2025 07:17:17 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRn2o-00000009H79-25Fc
	for linux-i3c@lists.infradead.org;
	Wed, 18 Jun 2025 07:17:15 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I5snrQ032110;
	Wed, 18 Jun 2025 03:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=xpEAYvZLAh3gR76m6/qRao45ed8
	Isl8God5610JbqLE=; b=qN4wc4XXCXt2sPZQXWoUuQhk1ku7Ht2CNBz1XiZEpol
	s0RopwDq8hwN/q5jwi91xd1TrvUP4KA9SBxIsUKjzkLZc1Vn7/qlXBwLgpMDjQcu
	n23S9oEJrn2fXX5q/ilaDKqU7cPadNSwxMVpjIQu48JcaRYQXwnhVOH/51LWlKgG
	WPpU+lToi5D/zCswBV21ZpqLPerlC3bWJXDMLIugNsNhBzYIUmQPoktCMp+HmiDR
	PupciDym3byEJZV/ETwjfKDrxKU7f3fAMeXCeMdznaw3MswVm/Yv5Tje2kA3zA8y
	GUyxmCmfEDWKTD/dZ0Em4pHaw2aHM7fNwlKgy0ilDyg==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 47bfshaeq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 03:17:01 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 55I7H0Qx037088
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Jun 2025 03:17:00 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 18 Jun 2025 03:17:00 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 18 Jun 2025 03:17:00 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 18 Jun 2025 03:17:00 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.56] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55I7GkPe027550;
	Wed, 18 Jun 2025 03:16:48 -0400
From: Jorge Marques <jorge.marques@analog.com>
Subject: [PATCH v3 0/2] Add ADI I3C Controller
Date: Wed, 18 Jun 2025 09:16:42 +0200
Message-ID: <20250618-adi-i3c-master-v3-0-e66170a6cb95@analog.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANpnUmgC/3XMQQ6CMBCF4auQrq0ppdTqynsYF0M7wCRCSUsaD
 eHuFlYa4/K95PsXFjEQRnYpFhYwUSQ/5lEdCmZ7GDvk5PJmUshaaKE4OOJUWT5AnDFwCXWpjK2
 NVSeW0RSwpecevN3z7inOPrz2fiq3928qlVxwoYxBIxy0trnCCA/fHa0f2NZK8tPrHy+zR22aM
 4CTuhJffl3XNzlo51/tAAAA
X-Change-ID: 20250604-adi-i3c-master-2a5148c58c47
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <gastmaier@gmail.com>,
        Jorge Marques
	<jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750231006; l=2324;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=Ien8JIYHGNL5X9LLCr5Rx52JCUxh6saVyb5rnnTYT6A=;
 b=VHvCqbVxJVVuKcCIgbiwFLjMYONjHpn2RhKRqQfhpRS9Hl1a8C3RFS0La6yvwPfC3shpefbIx
 hLANmzJUM6OD3uUiDhqiekhJZZPHMVr1Bj0BcuqvBVJP6rZbzjKUOWL
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: G2roF2RkUwpr_wxd-zUKabprrgpFIutW
X-Authority-Analysis: v=2.4 cv=SKhCVPvH c=1 sm=1 tr=0 ts=685267ed cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=wI1k2SEZAAAA:8 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=Au82MslZ5VMqyGn2ihwA:9 a=QEXdDO2ut3YA:10
 a=6HWbV-4b7c7AdzY24d_u:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA2MiBTYWx0ZWRfX6mL8myALvm0Z
 Qkgph8kxruPUuvfBZGcj66e7tD/N32/RgpMeyjrCJYdZz3R8Bw2h2pclmELh0cXm/In6COcrTNI
 oOqbc6Wtk/lBm9++52BcY1mbug+a4uVOkBpCxdp7/mFQMv0MyfjPwY9ARK9iE1irURfn0H1zfLR
 4qL7WQ6LsRI2OlfY4zLxrwBCUsK8Dx9gEMcGmq094uIxNPixeooBAmTEN/s1VvBnJpB64Fc8yYa
 5zkZtRYmFJZRgSfjlGV+tBY3eXqfbBmGNkUUova8aLuRbs99/1WWLrjwkGTjaKN67/CfRMOOBuq
 k5LXBRSio9FZkPZn0R4AkMjago5RVMUljdkywUvtRxjGn/8KBl8GjyVi9MtKJQFrShFba4wxie/
 Ty6w1pZsDpSiOaNvldJlwpQRqDRhTWy7tagwVkWt3A3H7ehnhEGohfk1Mltgw3BA/7tu3/su
X-Proofpoint-GUID: G2roF2RkUwpr_wxd-zUKabprrgpFIutW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_001714_543630_10312DD6 
X-CRM114-Status: GOOD (  12.64  )
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

I3C Controller is subset of the I3C-basic specification to interface
peripherals through I3C and I2C. The controller RTL is FPGA
synthesizable and documentation is provided at
https://analogdevicesinc.github.io/hdl/library/i3c_controller

The main target for the I3C Controller IP is low-cost FPGAs.
In this version the driver supports IBI (only the MDB), I3C and I2C
transfers.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
Changes in v3:
Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml:
- Small reworking of the description
- Add -1.00.a suffix to compatible

adi-i3c-master.c:
- Misspelling
- Remove REG_CMD_FIFO_0_LEN_MAX since it is a HDL parameter
- Use adapter timeout value for I2C transfers, as in
  https://lore.kernel.org/linux-i3c/aEBd%2FFIKADYr%2F631@lizhi-Precision-Tower-5810/T/#t

- Link to v2: https://lore.kernel.org/r/20250606-adi-i3c-master-v2-0-e68b9aad2630@analog.com

Changes in v2:
Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml:
- Move allof
- Rename clocks to axi, i3c

adi-i3c-master.c:
- Update license year
- Rework regmap to use FIELD_GET, FIELD_PREP
- Reformat regmap to have FIELDS after REG, prefixed by reg name.
- Add overflow safeguards to cmd, tx fifos
- Fix macro related macros (mostly erroneous `| ~BITMASK`
- Use guard macros, remove goto.
- Simplify daa logic
- Replace devm_clk_get with devm_clk_get_enabled
- Solve 64bit->32bit warnings on x86_64 systems by casting to u32
- Immediate clear irq request flags, then handle it.

- Link to v1: https://lore.kernel.org/r/20250604-adi-i3c-master-v1-0-0488e80dafcb@analog.com

---
Jorge Marques (2):
      dt-bindings: i3c: Add adi-i3c-master
      i3c: master: Add driver for Analog Devices I3C Controller IP

 .../devicetree/bindings/i3c/adi,i3c-master.yaml    |   63 ++
 MAINTAINERS                                        |    6 +
 drivers/i3c/master/Kconfig                         |   11 +
 drivers/i3c/master/Makefile                        |    1 +
 drivers/i3c/master/adi-i3c-master.c                | 1026 ++++++++++++++++++++
 5 files changed, 1107 insertions(+)
---
base-commit: 00286d7d643d3c98e48d9cc3a9f471b37154f462
change-id: 20250604-adi-i3c-master-2a5148c58c47

Best regards,
-- 
Jorge Marques <jorge.marques@analog.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
