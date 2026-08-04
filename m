Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC657C55184
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 17:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X0jQIeSxEdjP7tj23mROIU9Cb2oOQmQoVNM2UxcMGeY=; b=nqXbywXeAMQKlX
	lhPT1g9k3K7ffsUVU6iNgxRuA2dYu1jIIYoC71hiQQ9WFpy9o1MFfL9NBVmTdsEjnYjGOd5fxIFe8
	s+/BsxgOMPIGTr6duWi4IL3Nw+/KXEjjFXFRHO2LPYOf9QizUxmh6EdAQFOraX5hFUSJz6dgaU0Za
	mM9XBb7I3qnQXNOcV7bjo6sCGHfgYRXnpcUhoi2RFk3HoO/WBRrBN4ShqU0+xImsceIDoT9UKwADx
	5J+fuB3896DYR2KdnfllfzExr5Qnvzwe167uCEBZo+D2mlGb6LK9gQqp1OisFoStnx74aUd9zm1Vd
	PM2HXjlhog/oiXLbcj4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJ1O-00000002VMh-1eMC;
	Tue, 04 Aug 2026 17:33:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJ1M-00000002VLp-3FGG
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 17:33:45 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674GfuZH774632
	for <linux-i3c@lists.infradead.org>; Tue, 4 Aug 2026 17:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wyItnuYAoSw/iX3WQl8cdPxSiwleyAQ9qgrs/f/zFks=; b=WSFpLY38+80fqZZO
	T0ca8XTtSMvaGsVT8TlKB8IYPBbmrVMphHdIBXmQNPQVDdldguwuneFbwyTW4Hym
	K2PuC12/0ohwXc1ftdZdY2J/OxT/hromVjhdprIjPPDxouVh9GX5o8jqZiCR76hl
	tEyxTFN+cqt9fYQBW2TOrpd9MTTQJc7X5kRYyHSOcMw4H74NpnSxFZ37SDOFKuYM
	woz1mR4iktjID03UP0IqqvJHCqqsF53ZPU7S8qVHMNuxlfQpug0qETs2sZNxkBfy
	SuatTR5Io7hgvD0r3EUS9q8ud5j8LKR07YLLEexUOxtS1FiShrk48h9UaL0k4ZzD
	6z0Klw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuku3083g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Tue, 04 Aug 2026 17:33:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e13b57b2cso65400b3a.1
        for <linux-i3c@lists.infradead.org>; Tue, 04 Aug 2026 10:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785864823; x=1786469623; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wyItnuYAoSw/iX3WQl8cdPxSiwleyAQ9qgrs/f/zFks=;
        b=d8OdLvJK2MwRzV0dON7HCBOtmbOrpQo85WoI3c1n431YJA7SteH8QwxdS8SsVvsxOS
         XFaSXLEgnNFdj0rW1aEnRuM54EnyoXHQrJgqsqIsQNCq8aOFWVggN8kG6aX97/x1xViC
         cPICt60vY71AiyHvwCRigwKcj+gx9gCz9f+SmNiAHzZn2HuNjl6GLsCJG3iMtXzKpv2S
         oL37Tx1wFs9/Uyb+UU2kWkHFUqimKQiq6lmC4IBT/cfFA/ZVZx+yz16L6BgcHXtwhDCa
         Y4qcYmnV3TYazgxYuKaTt6RykXA3JQ+a8QuW2Zc93J0ELkybH86keEVYgkr52MrLJqfC
         +i8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785864823; x=1786469623;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wyItnuYAoSw/iX3WQl8cdPxSiwleyAQ9qgrs/f/zFks=;
        b=TalXlODTfGu4QsnSDGKekfpP7a+Y7xZ4vQV1c6DygRqF8sofs2utrZW4rO60ezUFI5
         LTBvh4SP43fZgV5MlMBSe9El+PqZjMZMaivnj9eyr8yvVCKDp18SdQuFKiRrg5ybMqcb
         CN4C7BxaWvMhaNPJtQpiv6VwNoWF4J/MDunPFhnu/7UDKyMOtIVBVzXLV+hyl9Xs2CVk
         225BGYMgwjqCllBYVOAtERfSYEVNpfcIkZam52t7p8e6uUYCE+06DAI6VYeRUddWPEiU
         CfMXj2Lj3g0oJNTe0ZznAxED/G9lScc7bPDI/71ib5RECe0SWr5m82+kBJAb6wwWcQ1g
         FpQg==
X-Forwarded-Encrypted: i=1; AHgh+RoXJN8O45hMj8Y7KGCPC3gRmNhj+Vc3AbeuYzvDoYaui17fBq451oGy1cB1tDJusL0mQX0CTMt/L7I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0JOFLZZ5CDP51/77xKeZ4sd/NjCd+MOAZAm01Lj5NhnG3QiPe
	ZrAq1Ohlhz2/QP/qMRRW1/hFY457Y1FVEHTCDXzc61MWc3xYNsVge9NIfDBZcoUltNBlxkb1dLP
	oKzrBIVq9PMkTTWEquzzlMImtOIiA8eu8HoIgk6kY9qax/KSjAlxUAMi6P4HsV0vrMvP9
X-Gm-Gg: AR+sD10r/ZD33s8CII5W3T1rN4q+imD9LFvqMF+4YbwgO53et/4t6JPsG+q8cF2Nr7V
	lUoJXEp0Q0BAihOv05a/en56eMrd8091GCvLUAfuY3/QO8g5aaojcK88Kk1CW3gpxb0tytiJiSH
	uF8lcpGIEjmiEmD5f0jxs6CZlkEMSHTMf7YYmKKHH7yuyjcXNuQPR1L9Ugzuq1/k1FeZeMPahnS
	evAsuBhgxeTLCjqQo7Vnc87r60JxFKtQS/fb4qpuNdhqBbYxI9ij+Mo+R/2V95Ut0yl/KjUEpZU
	1SScrt9HnLEjs/ssXQ5CWE46wdxqOvq/crcuGECzwdxMzxFA6pXrs8imIoADvFC+tPqj5L8q7Ej
	NDTosQk5dLK+uWWI4oNO9cTvrmEvhkN39jg==
X-Received: by 2002:a05:6a21:6b0f:b0:398:9379:d04d with SMTP id adf61e73a8af0-3cb85e6c922mr471746637.24.1785864822735;
        Tue, 04 Aug 2026 10:33:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b0f:b0:398:9379:d04d with SMTP id adf61e73a8af0-3cb85e6c922mr471711637.24.1785864822315;
        Tue, 04 Aug 2026 10:33:42 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.234.41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673be99sm12590660eec.15.2026.08.04.10.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 10:33:41 -0700 (PDT)
Message-ID: <ed403582-d3a9-4d64-98a6-5bc8537f0f54@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 23:03:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 03/14] i3c: master: Do not treat master device as a
 duplicate target
To: Adrian Hunter <adrian.hunter@intel.com>, alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com, akhilrajeev@nvidia.com, rafael@kernel.org,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-4-adrian.hunter@intel.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260804133810.184905-4-adrian.hunter@intel.com>
X-Proofpoint-GUID: m2I5YWOzGE46aP9HUKnII9wSFm8-qXXR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0MiBTYWx0ZWRfX0tp2Qbyu8N79
 wc6dWZXCmBAXZ2adfTEb098KFUOfLG/1jx4fPyIUx+Xck8Ceqg2m+RTDUzMMlybxU+iEI3oP+bL
 VHt6llnJaFaU0dkzxMuRyQef/V2XVJo=
X-Proofpoint-ORIG-GUID: m2I5YWOzGE46aP9HUKnII9wSFm8-qXXR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0MiBTYWx0ZWRfX/b6S5/5RL3Lt
 +IS1eFdONxSMCVrOZHlkL5f/4bFtHQ4wpgpUXbZvnmKBw/XenhHeTFMqFNfIFrbhQvuXIua5JoV
 skWgPHSTmoNGAGYF4HATo0MCxBSB/rH8h5l0W62ERWDYprPAYdxGZP2KSxGuwK1vzzKxpmI41S0
 lWvv9VsIW1B6CoRHt3PBV+192bbGQKGwIatO1W6teYtccji7UrnnhDyPp1jn/RwzFz4jHd4aJki
 hliSY0PGAS1BV736odRLpWIqwMdnUCJaGTCx0TwaDWGzboi8d4ZDvYnmrZr6bu8TzVT1+KyZom1
 eHOxRPOrW9+FLWXZtzVtE1DRYmlZetrde+MDN8IRGQbDZXuUZJI3YsrZI2HMNbF4mdV8B8GtlW9
 1l33yZ1aIjxSB3aBY8nR2ShRYLP196dlBwMaUDq0Q2+pw+kCIpSQdtVyq1Hwdg1hknR4ZpvX6Dr
 ahQdkPGFMt0hG73QyIQ==
X-Authority-Analysis: v=2.4 cv=X/hi7mTe c=1 sm=1 tr=0 ts=6a722277 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=/lQgZcjXNA7ZrIsIl4Cfeg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=RtcsEO40LIKQJCypwjwA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_103344_872288_3A399785 
X-CRM114-Status: GOOD (  15.16  )
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



On 8/4/2026 7:07 PM, Adrian Hunter wrote:
> i3c_master_search_i3c_dev_duplicate() searches the bus for another I3C
> device with the same PID as the reference device.  The search can match
> master->this, causing the controller itself to be returned as a
> duplicate.
> 
> Since the controller is not a target device, it cannot be a duplicate of
> one.  Exclude master->this from matching so that the function only
> returns real duplicate target devices.
> 
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
> 
> 
> Changes in V3:
> 
> 	New patch
> 
> 
>   drivers/i3c/master.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
