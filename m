Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6C5C54795
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 09:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VfDBdKwxwACqU1blxkVgE/katArlCeG05XUgvC90Lbo=; b=V3lKn84JnIFXbx
	fhZa9F1wDGIlooM9cOALRLSmSkzYAYlGI1MdlBb6Y27xnFqLGRvVDXjiQJUVtKdFVdobAo2lxVRH3
	X57HLjpRrp3wECgZXVZpTm+uH+533mwrlVXsjN2WLat82la7PdFZLnVNuCs3gUiAbgKM0HF/Qpt7l
	V8c4Bz9ZRB9VJjjTud7Kgy8OpFK+8ViJH2GRY4yyG+fDj8lhT0ye71oaJw0mqgrjOAeFkwmIoibZ9
	6xnPXx0mQ6Yrshs3F2fYojZddaejAmXXBxvODfGdN6OkQdiDwRuSL00RIH/6Z4xU+xiw2pbm62yrq
	Agkyb0AiJMqR3nFOZp9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUlZ-000000008RD-2nwd;
	Thu, 15 May 2025 09:20:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3NgB-0000000F3lr-1t5Y
	for linux-i3c@lists.infradead.org;
	Fri, 11 Apr 2025 23:21:01 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BF4tJo028877
	for <linux-i3c@lists.infradead.org>; Fri, 11 Apr 2025 23:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ynZ5lGPahO++H1E3LeYAHNYzJtD91JsU9K6PqBRu/8=; b=GIxDHCjOIQbX2CIA
	DxLe36WT9vyNNzSE0DqQK7L1dzfcgY5VQRdsA4Ab1uuBBujqoq8bO2d6BSbCL3ff
	JmAZrEYEL7P2pqagVDoqThzRVceMPWF06wQWiTgEiGxRBBUdD7FzL3FO8ZrQVQFD
	r9Ex9FHKotbZPjFfAc4GIsfda9u9OoYx8Q+8gYjwlHiH/IuGMuDx/kuM+ozCKrEF
	93wCNtjCGsGDKaJ5ndn6og76a2GC1X9ZVXoaJjWawxpiHshZSpvZwgMs38mq+zqx
	3nQscxhnHt6S3+GnE/hcH0MCQ1R9UnuFhWt44Rx/86YcU9HRaZ/x3dXSiuCLDBlV
	R1uXLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbuuw6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Fri, 11 Apr 2025 23:20:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5ad42d6bcso59808685a.2
        for <linux-i3c@lists.infradead.org>; Fri, 11 Apr 2025 16:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744413642; x=1745018442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ynZ5lGPahO++H1E3LeYAHNYzJtD91JsU9K6PqBRu/8=;
        b=ErnCtbMT37FDXwtunenUCGO2mTxn+D4q7Eci1CgTC7gIHwRVS5OsB/xdZlPgowOJ9Q
         cXcHNDO0wM0wmso+LyIrkD18IpyyXl3Ws4+mpaDWz3d0m6K2LE7CVZD3ASNdnEy+03G9
         WM9oP7ZL1x6/L1qEmSQmMpv1Qn1/cxwGr8ZCPOZQ7WTboSuFUNrhNnZfYAOFDowscVsB
         B9iCJj9s0/NXbA051cKhu1Y7NbH19WsMQ/vhMIVESzVX6euTdNLjx9abJvZBFt3zG2yE
         HrTSso6WM2/VqDyVcornudfRGgtkY73kwVwO/xsIXt719e+LhDRtDHu8Y8XME3+7ExQn
         gRSw==
X-Forwarded-Encrypted: i=1; AJvYcCVNqLhn/K5LRseE4IU6gNxglWYgYkby4WCLFTM3l+odyEf/ITgHBzPFyZFUMyaIQmykGI1JDTuicGs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjUO2JKbkZ2Tt5FyOTDe9ncdNZFXmqRwpcxub210BD/e5BvEcU
	ZWelar0nG8Bh0NJmY/W6uhJfKHqunl69BsiV83W3yPvGxyjBmopp1wIVi/sYFROK/7ImPmZwCMA
	rkn/ulhTcGIrL1aqqvWElPBI2bQx6JpOuIvJXrwuFx6ZOouLqrVRgWsJlFKHWEf5T
X-Gm-Gg: ASbGncsmRZbXL6ytPylgvIeDpuEadzfsml01AZLxby0za0ue8wGHUAuRYFWRHSx8eds
	Rc/I+qCu96Ct5aOo8S5cYvi2/XYZcPnkuBZGaFyAnUMbJucTehcvAhF4I1WH8bnQbPeC/kg41jA
	n1dL7d1UGbDqiNxnMXW/KCChVrm9+ybCLHzxnT96xJE2qvWHr9OVsNN1vo4cw2I0MYqfD8GQaN9
	7NnLRU/YB1d9LCk8EUQTVQtlH8LU8C8w0/IlWht4tDLLZjUkwA5mqSudnLaArcISN/KFy7CfQWC
	vylKJcUs9tl/CQZggdx9FkUM09DC9Clljpp8fPjdViHZbzqEjYTtAifWEektDa6VNw==
X-Received: by 2002:a05:620a:404d:b0:7c0:a898:92fd with SMTP id af79cd13be357-7c7b1af6badmr181749985a.13.1744413642530;
        Fri, 11 Apr 2025 16:20:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErC3V5L5WaKtK5ntsNCBMz1sCeflCPCZiPX/TOLUhw62NWHCCe20rY0BgJeksBKJFfhu2ytw==
X-Received: by 2002:a05:620a:404d:b0:7c0:a898:92fd with SMTP id af79cd13be357-7c7b1af6badmr181747385a.13.1744413641914;
        Fri, 11 Apr 2025 16:20:41 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be9c1csm513064866b.58.2025.04.11.16.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 16:20:41 -0700 (PDT)
Message-ID: <eb6e8452-db37-47f7-9265-fd47d4cb69b8@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 01:20:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add Qualcomm i3c controller driver support
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
X-Proofpoint-GUID: UJpi0QEWK3ERazZQLVR-L6HZ28O09QFo
X-Proofpoint-ORIG-GUID: UJpi0QEWK3ERazZQLVR-L6HZ28O09QFo
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f9a3da cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=XURAWvRzPrrx6AlyFGwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_09,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1011 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_162059_485772_8BDF1C0E 
X-CRM114-Status: GOOD (  12.64  )
X-Mailman-Approved-At: Thu, 15 May 2025 02:17:27 -0700
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

On 4/11/25 1:35 PM, Mukesh Kumar Savaliya wrote:
> This patchset adds i3c controller support for the qualcomm's QUPV3 based 
> Serial engine (SE) hardware controller. 
> 
> The I3C SE(Serial Engine) controller implements I3C master functionality
> as defined in the MIPI Specifications for I3C, Version 1.0. 
> 
> This patchset was tested on Kailua SM8550 MTP device and data transfer
> has been tested in I3C SDR mode.
> 
> Features tested and supported :
>   Standard CCC commands.
>   I3C SDR mode private transfers in PIO mode.
>   I2C transfers in PIO mode.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ----
> Link to V3: https://lore.kernel.org/lkml/20250403134644.3935983-1-quic_msavaliy@quicinc.com/T/
> v3->v4:
>  - Dropped "clock-names" property from dt-bindings as suggested by krzysztof.
>  - Makefile: Correct order sequence for i3c-qcom-geni.c.
>  - Indentation corrected around print statement.
>  - geni_i3c_probe() : Exit with return 0 instead of ret for success.
>  - Added sparse annotations around i3c_geni_runtime_get_mutex_lock()/_unlock().

So this is the third time I got this revision in my inbox, previous were
<20250410084813.3594436-1-quic_msavaliy@quicinc.com> 10.04
<20250331164648.2321899-1-quic_msavaliy@quicinc.com> 31.03

b4 should be automatically upticking the revision counter, please don't mess
with it manually

Konrad



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
