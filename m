Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069FCC5AC67
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 19:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZaYDRT0Te+ZbZHjVMpMrFvABKXYX9psjCfma8QVl4Wc=; b=V1sausfCrtnPxB
	fq5tjjOTviAfiv6lkgKHfOO9c6jEaxGmcSrSBkqr78E7hIbscvdbrPwqMiszwPp8sp/J4qEiH6Iub
	rLzVByNfwD2hyDqNFYYU/gbtjfyP8LPd0tTB53wUpDS4JCG4/s6L0XhRPFQ5gZddco4blGfryg2en
	UO6C2w9xNudYh/iEmnm0MWsK11ihZdeLG7QuA1O0awxwIM2Jh7TbjyIHJgADYIxCzeaEGxtr4sdzf
	G4yxrk2bdkXaVMRm08Kzg+ty+bD5QOZchc5ByGQ+0L9U3Gt6E+JRaIe3w0bpPI+ss/oAE+na7h07L
	E4uOI65kpYqEPXaCFWgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws3RD-00000006Xhc-3sEU;
	Thu, 06 Aug 2026 19:07:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws3RB-00000006XhI-3Dax
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 19:07:30 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676IHdKP3051102
	for <linux-i3c@lists.infradead.org>; Thu, 6 Aug 2026 19:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BX8ZxjTul2K/taj0A4BXwYLfVRhcZVy2nUyT99KFjNc=; b=ZO8EtX9ZPSKmw4Ue
	ogJdGGY6I4QD0zNOPjfdL9QOL3RlfvOOSMXfQu0xqprdpVaZsuvFCok89qPH5FZ3
	tbNQD8Dxz7T/vFe9rWJZ8L8Sv7bX1oooCbgg/yG9TUqSqynI+Tkp6PWnaIvstz7R
	F/b+0EhXTOOGkqvdwSngCmKDj1FHNQ/XpncKAwkM3LejzfY3Bs1YGiJfziQaDVWq
	5Iv8opda3eogSjlSJL0eAYRCAE47unQFaK5MQIkTxBtRyPGBmj6rohHGjuWuUt01
	ZC8FLRFSCOJ0gcdgrvTjkt7MFWBRVAaCjTasfZayeZn993kq2lJCkMljoRTG63XD
	7CZgcA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6grawb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Thu, 06 Aug 2026 19:07:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cd01a14e81so35661325ad.1
        for <linux-i3c@lists.infradead.org>; Thu, 06 Aug 2026 12:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786043247; x=1786648047; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BX8ZxjTul2K/taj0A4BXwYLfVRhcZVy2nUyT99KFjNc=;
        b=GfMiRGTtRPUAt/mVpm6MEtn7V4F8fAJVY1dtA/7crIindEe9BEHZS6ArjR6tdpZ7yL
         xMRlXeVCW2O/i5N7iohWVoIpwXjy52xKnuSzMPxSy37qrCoFQKSPk15ls8KSFRVraNar
         JSbLxCUSSWQMcR3z/iIOm5ZrptBh2+JlhzV9pEYCz2iPOSj+WAAL1oX3mgAuSaLPHrcz
         gdoARrJmfwWZsjtRJKiJFfZd3j8fhw8EaxYfIvH7D0l6KKao+dMz4VCAA/xF0lNnWxTt
         6bSykUjfy8D2D20iSgJhemrv/yJ5X36IYjd0wlz5OL73v2NcrclGMdcR+TAD65H968ek
         Jg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786043247; x=1786648047;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BX8ZxjTul2K/taj0A4BXwYLfVRhcZVy2nUyT99KFjNc=;
        b=gok/tlR0ojE6a9EMggnT3QUZe6XS8gWnLbigMtBmlN9rhtGgN7/7UB/xB494eoLKhP
         HkQscZUWo4jejOvUHpPMHRCiywSkzoLOzEEo3EZWSfolboyekDdzSGBa6+xetj7vfhOJ
         qKSljzZSBtWJeb1BxZXJAP90Z0/5JC1OkyoFkcu+ka+tKcaQx67h6C+URTXZlSspGxGQ
         T/Ihw8zUAhiNo15T+MbZPEjx8oZuH5EHIbgzzukn1OMcoo1LPXOqbtT7svH4yynz3pMK
         +G6zSF2QYMimYGNhjure5KrNkxL1ATDRMTwTYx2dM6hDPz2PPKwbqp3tsD2ui0irtRwa
         KXnQ==
X-Forwarded-Encrypted: i=1; AHgh+RoO5MAbauJhi2SlrL0mbbBEJqcp+gcFSwyjJ9HusgZuKEpTSqy3aYwaH9qLL44usWB9mO6pLoeJYz4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpOlzJYSsIDa+LdxUWzZykf7MNvjVDxKBoJNukKC/NAJrUhB3O
	RAagzCWbLTqfF0TOnZf2bl6Z+zlZuKVoG/JKxHh6Fr3C5Vcn0rsjQ4TxqwBfbMylF4e/YL1DKMP
	r4z3uPXYF97ib8/1QVcXP0NVHnQ+0SERqUc9w1F29I+ppQHtTpA+cPDH8nHoUBstwZgwqt2YiLv
	bQ
X-Gm-Gg: AR+sD12ItGQp/ZUjOBjp42MZfhstFtyRql2m1YOrgLhedKrzOXvbmXa8jOifSsj0xf1
	c956/Js0RMJneuGdfItWRTpynBb2IfBXDlmY7zyKsWCTTMhXY4SWG1tIhd8zQWXs1esQGq3qpxg
	mmVfEsDVxl4gqzwzW1IJJSWo0NnlN+XhMQlXtnpxOHcCizQ/alqtSWtpyHz9KQXToDPeaqhT/ql
	AutHTb3djPtDyKNc9l6WDeyG6tblbZ5az2/3g4+k1L9f1smoRnQTgmC+8TgsVAp5694sGckyHy+
	stQ/A4D5DTPkUZRdFlWW1uVAT7mB1wj/YM7FF1Pb4aCgA5ZyMMamX53K+rKOPbbXS33axVd8ZzR
	14ErplLF8VfebhfN3WO7jF2nMDwT0h4fsDw==
X-Received: by 2002:a05:6a20:7285:b0:3c3:7a0a:18a6 with SMTP id adf61e73a8af0-3cb85eea69cmr17032501637.18.1786043247158;
        Thu, 06 Aug 2026 12:07:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:7285:b0:3c3:7a0a:18a6 with SMTP id adf61e73a8af0-3cb85eea69cmr17032424637.18.1786043246641;
        Thu, 06 Aug 2026 12:07:26 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.231.86])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315ae6c1f9fsm7932348eec.17.2026.08.06.12.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 12:07:26 -0700 (PDT)
Message-ID: <f799295b-b3c9-4ddc-be3a-fabbfbb97b2f@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 00:37:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 13/14] i3c: mipi-i3c-hci: Factor out i3c_hci_sysdev()
To: Adrian Hunter <adrian.hunter@intel.com>, alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com, akhilrajeev@nvidia.com, rafael@kernel.org,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260806131857.119830-1-adrian.hunter@intel.com>
 <20260806131857.119830-14-adrian.hunter@intel.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260806131857.119830-14-adrian.hunter@intel.com>
X-Authority-Analysis: v=2.4 cv=frDsol4f c=1 sm=1 tr=0 ts=6a74db70 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=uB10XSru4U0CyR2DWkO06w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=pIyxDqSOQZZ-Xg8wykEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: NlrMmu6blM_q-rQU6cjZZVNa6ICCvG2i
X-Proofpoint-ORIG-GUID: NlrMmu6blM_q-rQU6cjZZVNa6ICCvG2i
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE0OSBTYWx0ZWRfX18B9PS4xrwuq
 WMZFSJWNLjQlEzWbiMPTMbz9q5clL0AlgdmqIsV5iR5JnUR3PFpzW8fn4e1HUKPLw9Y9WiUdYd4
 UbexHIWXsCbMx0O+5h9YZL2pve53fJQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE0OSBTYWx0ZWRfX/i/DEEltP5/D
 DyWlWJlFbt0+M+tgbWPLDJjD6pidB5nr6tgw3aNVyPLI8/iOCoY/htmwblbKwyaeJ1mymyO5uxO
 N4TKuRZdI3qtgIkuXhH0LaxHHDpZ/UYPKcP2t4dK5fN2mZ1RoA5iVTjeqlYYFfea1RYg7XJ3fIq
 uPAqVPBTQKQ2IAID0WfC76cNTRTHT+qOYBhnkdQ5MDN9PXMPPbRt3gtkRXjnZQSRjBuAJIVFV4v
 ESIRU8azFMhAFfa7lxNrnryO1yOv6GhvfvtqbPIFOZEcMQlSuaKDlNBGFiAFWe5sCLvGzcsS6WH
 n2UxSQxJ4an0yAgiPnSQ2Svvpaybu8umx8h4BDxUvOxEnvYljj09wqhLGcZXV8I/CMZ+FSqUFki
 OY4X3SZ5AN5KlIUCAm3wuCQdfXVtiGjv02gSh8wWjhxLNZI90Z+SbybnrQXkM7dvgysHMBbHsVr
 RHVlqhlZFRo+jbrucTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_120729_923727_2147087B 
X-CRM114-Status: GOOD (  11.74  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org



On 8/6/2026 6:48 PM, Adrian Hunter wrote:
> The MIPI I3C HCI driver needs to identify the underlying system device
> used for DMA mapping and PM operations. The logic for determining that
> device is currently embedded in the DMA implementation.
> 
> Factor this code out into i3c_hci_sysdev() so it can be shared by other
> parts of the driver and keep the device-selection logic in one place.
> 
> The explanatory comment moves with the code, reworked as kernel-doc now
> that it documents a function rather than an inline block.
> 
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
