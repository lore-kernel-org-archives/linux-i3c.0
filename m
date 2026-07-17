Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8167DC44514
	for <linux-i3c@archiver.kernel.org>; Fri, 17 Jul 2026 08:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O0Thr/jGZLNttPUV2qargIoSPQkDxxVLvZ8yuNmsJvc=; b=gXiwXfC2D2Ii5S
	kmKrHfgYHLCtyhvU+Q1zAfyrbFgl1+9yNdv+F6D2w9bMKFsNSQ8v00tsOEaIMMUkgkcHEDgDJeXHl
	z0g9voRzLwfyD+U/BLatFM2VqbtdL3UJw46AchTfqX8rPIwcV2u1HDzFYgXiqfnnmZ3tWEyckm0iQ
	xrgenjVkyS4RGU7m0RQU66BhvrbfFCjgx/KoxoggrPkFmLxe4zG8wTuHIU+nt7mpkBFJ996SxiGsH
	SoU2BKeWlmOcORIK6RNUdy+tokTqCJt00qGgikJdcckZkkWl8k38JfwGi+KXCi1f/RVQZboFJPo1q
	zklf0Ul/ZIBYZt++f2Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkePO-00000001l5u-0q9e;
	Fri, 17 Jul 2026 08:59:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkePL-00000001l4t-1w15
	for linux-i3c@lists.infradead.org;
	Fri, 17 Jul 2026 08:59:00 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cfxc1078357
	for <linux-i3c@lists.infradead.org>; Fri, 17 Jul 2026 08:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6MbJnmX7m7Q+rNiwCmFsJ4wLFKfE9U7mLaz8j8CV9U=; b=l400jifcL5aKd65B
	5LUw2Bc0DKEUaD+NP5xqtPA0B+pUH7FOZJXvTs+5QjLB6A5Gg8elI6ZNoyfPveE3
	c6jq6vIIbzxH9mI9jgJ3j0N+TLBSoEiiPaWzLOHUlLViZNgsZmc/WjtUN0Bh+1wD
	FBsECLyhP50+rHKfuAww3lq6pCtK3FMsoNMX/+5UPmIhIgCf+34zN7ItdPiQRVn1
	YuBZTVahOP5+znFPqWN37skx8eW25UhncLxEY5No6gd7D2EJk6mlPGaNSy+HmlSv
	7ZU/elCzCRgFqR2DaXZBaHSiUoaiCj/LdbpP9HjwCRdDBT6RXnsOPSUQ69WmcMTU
	YlF3BA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym1ca7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Fri, 17 Jul 2026 08:58:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so113877146d6.1
        for <linux-i3c@lists.infradead.org>; Fri, 17 Jul 2026 01:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784278737; x=1784883537; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V6MbJnmX7m7Q+rNiwCmFsJ4wLFKfE9U7mLaz8j8CV9U=;
        b=W2HRlciYJk5Rif1oxWescJKn6yoOjN3LFQgxjU7IOwyES9KRFsqE7gqF1mXJeomA9k
         u+mk9Fa+RpTzSuVfgeKd5RQKpgEhqTeX0d0e92vZAgZ29lpL+iSro3WEKU4Zmj7FVLYD
         RN1v//dzzBRxuF1ThcwdMAZ3473Mg5Bl7N7bg+nuZtkJNUm74pKJAHobGTAMdR6NfEbl
         om2qAe/ByvlzHAylX7zciYedNpLP1op8R8/Yz1FHExwbeCJsyhXxhJXC3lvaf44C3Su0
         pCf+II/96jqU5OKaab5anWhGvmGtJj/iJW4n17MIq+feN4xJywFDNpR6TDnMWSBM9tiC
         njvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278737; x=1784883537;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6MbJnmX7m7Q+rNiwCmFsJ4wLFKfE9U7mLaz8j8CV9U=;
        b=bEsgR+sD2gu+AnzdIB9tUdRRC3hFMlkYlNL6NUC3t1MvmrjL8nolBLdCMOH7oH4m7T
         iTFD5pckdbgEau+y7ecJHDVT+QFwLGqb3D5USlI6bRbD9FC+fXFcYLxf9Oq8ghA10jDu
         HvQbeknXorXGuSzL43XJfMa7iVLZIIcAcV8sGvPYA9rI5usGZz/rQw1AaLwy5ra2Qq+0
         wU+p4ubUbnwNuCz10vECWm97w8NaLRNt4kOBCMTDH9NEwH/T/fOxHxBDakSLHhnONZoR
         KYfzQi5STuhQnlXOkLrnJYXjESWknI3NtUMGPV2BENr4My4LaebNXdt+jLJVh/5gj+Wa
         DOIg==
X-Forwarded-Encrypted: i=1; AHgh+Rob3B0Sf6h6W+Z5OYKpg2cq/g0ag5kYpbCCWFGP3/QS6RwbdXKo3rX1sxgQ/nK5fiRwlHCa9WwlIro=@lists.infradead.org
X-Gm-Message-State: AOJu0YwhnXSqMWG7uATCVXLCqZn0gT4kGpaW0TpdG3xAXNy1v1KpUZXx
	wLxGb8nGW+4m0YkvvpxQTTNu47OeRtbHIh8pUxJFVF6vudZPFdN+cazAbPQi+34w5LtSK2zZGS0
	DtJ7slDoCqBBc1xpJE/Wmfl+m/z1RhEjJojhSXnEXj9fbAQPnaEogxdfN+Q68U7PJbvmH
X-Gm-Gg: AfdE7ckRSBeRLAGtDpsVyxatRfho1weEqKSHtGjlRverPIbqbz/vnGZsyNLPIrznLxP
	zP5Dg6MFEhC5UBGgsURJmIcc1KG1KvVtm3hwqOZw4Lv633M16eplFCZjXN3ElMGHFBUJxZqqwh6
	toRSt+1Wr5zBrzCHpZOs/vxzGATZKkV/vKPX2B2Rogg+7YouHxClwSM6Xx98tzDz1MAhzQYIVbq
	Bp4I/mWqZO+18l7QsphnZui1PCv4JJnJ5s058UXBmlvt6O2twli9uzfhSGE2POgqxaZd2egcb2m
	ue9xTUotc08ki5EnXLDGW01v0QDVPUGEQKwOOjywW4DdNl3r+BdQ9cv5y/y06rax7X2CEynDAy4
	Kkg+R2J/WS6H/WauvPqvWJYgls2qR
X-Received: by 2002:a05:622a:1346:b0:51c:1eb5:333d with SMTP id d75a77b69052e-5213eb757d0mr12604681cf.66.1784278737599;
        Fri, 17 Jul 2026 01:58:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1346:b0:51c:1eb5:333d with SMTP id d75a77b69052e-5213eb757d0mr12604541cf.66.1784278737262;
        Fri, 17 Jul 2026 01:58:57 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e65644sm1911449f8f.16.2026.07.17.01.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:58:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Jan Kotas <jank@cadence.com>,
        Michal Simek <michal.simek@amd.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Swark Yang <syang@axiado.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v3 0/8] arm64: Add Axiado AX3005 SoC and EVK support
Date: Fri, 17 Jul 2026 10:58:47 +0200
Message-ID: <178427872043.9452.9219608850005529427.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a59eed2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zGYnv34WkyyXCUjmJXsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4OSBTYWx0ZWRfXyY5owXZYfT5K
 fsXyHJpcKw3mOsMjJQ0U4/5BseCQlJ0NqPi4uqm/FwB495zRzxxpVZd8QuzQ5+ayjs9l5KSGFMH
 2SWLmcNPtFdnsld4ptOV5R3xkDZ+OwDXMpkxWZaDLpv8ag6clKT8H+rH0ODMpld3fjqw8lQoibZ
 Hg03CmGFPwujy6WXevkWmtt+UGarkuU8Cfiiwm+6CYRVkBtBGYNFRqrFatjX/D6zi/+3CI/LbBy
 a3cUo8MTcr4O2YXjfAKjW2MRi585sOxYXEM5DRqvT7bcz0FoLRJ28Liq0Nc1TdCDwqc0R+RC00o
 wfOYe0PpdjTTXObNh7CQyyRHD+HBRvRpdxDNChWYWEFIEVdH4LRxk0lysm6lX3dx9GdKot1A3Mo
 fA47N/Kn4XbEH7a6tA1BNzmiGZ/Sdp9eOOo6G/IR5tNihBcmixsiodt5HwPSgg73sk7SzZSerGS
 ty9auggnKNaZcVvhPQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4OSBTYWx0ZWRfX0UE0j4YyRcAE
 QbbFRq/fmxHvB3LbZ+L1MZHxU4VOLaTmRoDrUqCYZBHaspKJRMJKh1aFm4fDkLqDfQBzCEwABxq
 Yyf6TMEAXezjICNG9NneykRZBmCfxto=
X-Proofpoint-GUID: isPndoYRwjg5G-2fqdfW5lmtBtETkvi7
X-Proofpoint-ORIG-GUID: isPndoYRwjg5G-2fqdfW5lmtBtETkvi7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_015859_623916_83224FE7 
X-CRM114-Status: GOOD (  12.29  )
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


On Thu, 16 Jul 2026 20:51:07 -0700, Swark Yang wrote:
> This series adds initial device tree support for the Axiado AX3005 SoC
> and its evaluation board (EVK).
> 
> The AX3005 uses Cadence-derived UART/I2C/I3C/GPIO and Synopsys
> DesignWare SPI IP blocks. These are already described by
> existing bindings, so the device tree reuses the "axiado,ax3000-*",
> "cdns,*" and "snps,*" compatible strings; only a new SoC/board
> level compatible is added.
> 
> [...]

Applied, thanks!

[2/8] dt-bindings: gpio: cdns: add Axiado AX3005 GPIO variant
      https://git.kernel.org/brgl/c/e8a40b3566887c1c83d4cb87058d4e98ec8b4a14

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
