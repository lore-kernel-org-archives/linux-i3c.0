Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C994FCC6B0E
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Oct 2026 08:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lRedaua8WMxbv45m9iRMnjh/tBsAEiTazW+EZNex4yM=; b=ui62EjHNBiyNPM
	LEH11mXctjdhZrpAnaoenKIqew5052VC8dtMdh35rBRflMy+9yq8brxU6WTx+G9996u6m1K+5qj5c
	YvJCs0Or0HhZGR+Bd5eOy7ZnVeXX44HHir0vVLyKUmboxXbMtTxxAfkoHZH/zU/wWIdFMgsJhb5co
	8sqtE17N9Z1K8h5lR1cDo6jAqe6AM6IolBQjESnnfCGdZTJmJV0zsgjeVRJrR8OKvMQN8QmzDXLzm
	a+RhjBaeheZyHTPW8oZcXEIJFE1PmeCLZCvUCsiZ58biUHMNasIgRdQLKBR99n0fQVSFofF+rj6sV
	2EIFaTbzw7oB2+eMSlDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXUs-0000000CHhX-22et;
	Tue, 13 Oct 2026 08:04:30 +0000
Received: from mx0b-00230701.pphosted.com ([148.163.158.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXUp-0000000CHh4-1t1V
	for linux-i3c@lists.infradead.org;
	Tue, 13 Oct 2026 08:04:28 +0000
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D41XUZ3475959;
	Tue, 13 Oct 2026 01:04:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pfptdkimsnps; bh=OTvFQN8GuaxjCQFUI5eOYJ4ZW9EGafT8
	93ykKSAHAjg=; b=rys98Wxl7WfQxF71R1qe5aAeKZdRSI9ybm10B3A5RpmAIsyx
	O7UcuZVtg1ZbOv4c1hfZw0pheWWswk1NeCV5UEpcUTkKSffKFQfQDRRYIU3pSJmE
	Pl1Yr7NCvnlIo2SfSNJiK1vXeM3rs59pyLVfrREbznaW0oCZXoOwM66Nl0NCGn5P
	YDrL+it2uVzuxmTMiVbGTllp0puIM4crXEko9nKwDKVnUNPS53MS/CzkyJJFXrWG
	aMpkl7quq9qyGTFruyVaV1z6IVyQwy4dwm5rlSEtODb4O8JG89bB7L7y8i04eW3I
	erQ4mtTHWA52pb47i5WDkFXBPqOJaGxrpRcE8Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4h9419c1ry-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 01:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1791878662; bh=gwKT56U/gMcmxFvrhIA8kIdLdQvjSm13snfTFYrtgY0=;
	h=From:To:Cc:Subject:Date:From;
	b=E+UNlfhr+WOoCLZEBoTu6/rhbkg31dNXWMiMOv9e5jiRZgmss+1+8QkS1KuXuz4xe
	 rtlbQT8x1300PdHVAx3V66pqiL3urZFAxnX8BPSfQVVPd5MxMbFXkw2uJnxdaRjiwB
	 MH586NrPxaKr9Vd/gGwjj0XpXikRbleERWejwG0wNtvCsJU327OM31TYKfwbOzMYwg
	 2cJ/c5pYlIzjuaUFDrStMGG3DtnRB+3HdB3CrxhGPzMjW273CI8Ian0Q5EGns+7ODq
	 BQ8XUSsh7pCAdQz4dOpGM8YNarwZN4N73riqLzI65e4297ZHloHoyWedhL2edcaWTJ
	 Dp/DIrckte0+A==
Received: from mailhost.synopsys.com (eudc-mailhost2.synopsys.com [10.213.161.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 309C940230;
	Tue, 13 Oct 2026 08:04:21 +0000 (UTC)
Received: from Ubuntu.internal.synopsys.com (unknown [10.150.7.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 4ABBEC0F94;
	Tue, 13 Oct 2026 08:04:18 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
To: linux-i3c@lists.infradead.org
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
        linux-kernel@vger.kernel.org,
        Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
Subject: [PATCH 0/2] i3c: master: dw-i3c-master: HDR-BT support
Date: Tue, 13 Oct 2026 13:34:11 +0530
Message-Id: <20261013080413.7470-1-parame@synopsys.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzMSBTYWx0ZWRfX55+hBQ/C2GUz
 aDbPuJVsz45Y1rWPfuvp4gaeuzEvyh2UIMqbI3G8wEtzWXAWGlVZAZMV+OZqxu13QLXtbjn60lZ
 FOPT8U+kZ3Gj7mUIOncf+RELOwvqJcMAGTm+GzXIJW2XMmz5fwIpS0lNPaQD/apAvETyXgbjkom
 MPXEoC3m3GOo0TXPuxHZezdyu7x6cB+eGkXfhqbWbPh+oXVhleNqvW6ebZmOlh4Di6ctYXZBYrS
 Pq7WhTIkQA7y2YIykJ0bQydE6VswoGLNgp2rI5fZUPjNLNhhAZgioc4ytiDm3QbO3mIJC2dTa9N
 cUYKB+RgXzlBNgc5eCuIpp861kG/626JtUF6UPjBRiH6qWPjjOqgbSOaXECKgaQtI/20mqRfVYS
 Atd1+0/kCSPi6fp/TWYB8++Wx2Lq9pK2ro5mIDsIIKCvCGBl31zTQ5v1MqGOUQaOYCyuwJWfQoB
 DZzz6Q1osYlXCYuZF+w==
X-Proofpoint-GUID: 0WCI6DgLFtc1ht_XCE26vyBRuWZWeKyl
X-Proofpoint-ORIG-GUID: 0WCI6DgLFtc1ht_XCE26vyBRuWZWeKyl
X-Authority-Analysis: v=2.4 cv=bZf+w+PB c=1 sm=1 tr=0 ts=6acde608 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22 a=RtHSx0SzW_mo1qVRsOEA:9
 a=ZXulRonScM0A:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzMSBTYWx0ZWRfX1RZiwswm/CCd
 3HzKtw5dL/fdz5hTE2sqSF67hH2YL1DPcJSI6W45xI90MyGl1he5EWcM7gK+ALMbNyPSKFZL0ZG
 Di1llAvmPjzqWgDkh6lE0xLCCplVAlw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610080000 definitions=main-2610130031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_010427_623617_0C30C597 
X-CRM114-Status: UNSURE (   9.95  )
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

Hello,

This series adds HDR-BT (High Data Rate - Bulk Transport)
support to the Synopsys DesignWare I3C master driver.

The DesignWare controller provides hardware support for HDR-BT
transfers, but the current driver only supports SDR transfers.
This limitation prevents users from utilizing the higher
throughput capabilities available on supported hardware.

Patch Overview:
1. Add HDR-BT capability in the I3C framework.
2. Implement HDR-BT operation in the DesignWare master driver.

Dineshkumar Parameswaran.

Dineshkumar Parameswaran (2):
  i3c: Add HDR_BT mode to the I3C framework
  i3c: master: dw-i3c-master: add HDR-BT transfer support

 drivers/i3c/master/dw-i3c-master.c | 146 +++++++++++++++++++++--------
 include/linux/i3c/device.h         |   4 +-
 2 files changed, 109 insertions(+), 41 deletions(-)

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
