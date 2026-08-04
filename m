Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546E8C55184
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Aug 2026 18:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bgvg1FtExgFbaqAFJZTGJTZB4kClP8bEFo8zC3CRVkc=; b=0fl9WLOR9NmnKK
	gVLkYI3A01/wbtknW/VMoDmtcdwUsYbmtUA2ZCNYpHQ/20YF8kNe+tmLVSpKjxLqydMzg/Laz9cLE
	VFkKHJHJu5XDOZ4zyNm9z51YCDwOX+nDH0ln3UguHAUV2hWn50plQa3/ccsAJDlJ/Z1h41cayW+eo
	ZX4XG7h1iJjoXRgR+OKSAL6R+BnD3waGMQLVV/0S8id3oYAjt5Yopx5lvKbRDSa3IF+syRR5zfb0o
	VFFUiVQb7eZPrYuEze2Uymj9Sym3TmUGRzvN8CAz1hwqCj/2CK47mOzvFwn7KA8OVIN1Tkx3xQb54
	p1unxa9ZsxjSdSmD0AXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJYk-00000002Zgk-00fl;
	Tue, 04 Aug 2026 18:08:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJYh-00000002Zg4-2nBh
	for linux-i3c@lists.infradead.org;
	Tue, 04 Aug 2026 18:08:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674FfRSM4057041
	for <linux-i3c@lists.infradead.org>; Tue, 4 Aug 2026 18:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GU1YtUDGbsfxTlijAya+pOjBIhU0+IZyXpQLGX6+QZc=; b=o/rLauv3GaIsBjcx
	/uTgzvuU3kdMD3n6mT6NJbQU/cw8fHHY/QbTVehsDSdEAcF9ORRT+aQ3CqMzksn8
	kowqJPHoVobbZczkeSYcT9aBaREraZQI4u2T1zdFB3vYYOPw95yy1F2u5AZAistC
	A0HQXm1mO0/W/sHunI/80kPWpgRDRdOr5qqSTxoimsxeK4WEV61D3tQPM9ZdY/BA
	IBaxuYxLJUO8JXes8oqHIigPyd40NcSDsn1qNNG6QnQrhl++mlI8jwdTi3KNi847
	fkcIWGi/npiVs3HWC9jEO6SOEPhDPakfq3CG1xZzGcZbObJbQTjR+a8wpJtippip
	WuBxuw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fugmghh4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Tue, 04 Aug 2026 18:08:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6ef846b33so102367a12.1
        for <linux-i3c@lists.infradead.org>; Tue, 04 Aug 2026 11:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785866890; x=1786471690; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GU1YtUDGbsfxTlijAya+pOjBIhU0+IZyXpQLGX6+QZc=;
        b=JCpYdfy0oCCG/4JK/Cz/H29TKeI1XUeblbWeLP3yY7KHgXzNrlv733Lmu/Ke/vw1jG
         KmMFKfExyIVXXlP1QuW3hYFXcSqZzc1u8F7a0XLkBPxzHEm+DpTFr+5bueS3R+PEBXaZ
         agIA8xuPMFFRnzi7eYLelP8YWmXh/ti4130zPwvBl9ulVp6NTUKR4mVQMs3nsBCDasvd
         xxSgw4gkjCoGfcFAqLL1dpgiqyyskcjgn4h4C0k/05cv/cIvWVSKX45syWd/faYfEPZ9
         JvF7RGht8vLk5R0pq8MlhPbg53+nLAKU3L0o4RaVRQUtIVGe2zkFO9lXvvoiT1qs7qOD
         m+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785866890; x=1786471690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GU1YtUDGbsfxTlijAya+pOjBIhU0+IZyXpQLGX6+QZc=;
        b=fTtxXTe0k9cXGeVqxOwU1Zk5211JD4WGC8lvTWgHrr98SAY1DAO6yJpYcXcq+65cUJ
         B4SdkfjT3GfnSWAy8ONRawqAr8BHP7ofv/ZUwdqisXEShniZr9UuxWHX8Mfpr9M+4B0e
         H+5fMgQG5FCFslyBMnH3aEVa5tkh2ESVLQQ+07w2+YZkW7HpUMdhiM/OSKCKKdSVqtc7
         6ZZTEp3eZGbaTeYQ2HklY7wSkLHNd98fH8RNtomhigTrfzct6woGH4hbFf/mQq5tWHw7
         oq5p0xQiVndl3h0HJhBU/7wU+BFIDQ7EXrzt2xg0+ZhDTDiqfeyNJVDZ168aidks0D1j
         1h+A==
X-Forwarded-Encrypted: i=1; AHgh+RrkdM37WiTlnVwDqwX8pJBSL8yvhrESTC4ZAlse+zyLf0MpshmfqrUjacOS/xMe6bbty996XjrgHIk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5/G7rhKLCky3moYNzuztRxNNSuf8eGGFDghnAkvXVmeh+3Hip
	o2UtBoZOuinHXoBqq/qRPByPw3+xB1zCLRbqs+feliOFxE6lvNUavGBFBnAa7R1HmJqXZMg3jZp
	IJxNSRomkk0Zc7MiseJoNig4graXGBk/Di0wOMYnPcJ01bnDfEW3KMxfbwb+sz8b8uZ1Y
X-Gm-Gg: AR+sD12FcK0ZNHHKDBgUsMw5jKwW/BFvCaESxiGut4RrJv2+w3hKACd1YsqZYPScH+l
	t0wF7vumbP2avMDbw/WeAp0n3sNHTo1+p1Hky3BJFoLFus7c174PPaLFx3WkOoCR/OdTQh4vuyi
	gskRy7GTEsqVwvdaHPGSATtbgb7xiGYoC5S9VYuo4+SGDNsQ3lJlSvRmcmQlTRyB4G0xW7uxD8Q
	CdwC7FZceq7sipArPpwkHixsHh4Ng4NEDbzXA4+vcpOp3PNyBRKpjWxX+iogtRR620YRoaIacvw
	pN+tsp0FfYGUpK+MOLMUbviimQZ25pBJ2FhMeqc3sJYI58et/eRJIfTtgasA65C4ThF1FyePS3F
	zHZUzTq29f6i5vuP8OkrxJz5rtqbERD+vOQ==
X-Received: by 2002:a05:6a21:6906:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3cb6c752d6dmr5609283637.2.1785866890354;
        Tue, 04 Aug 2026 11:08:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:6906:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3cb6c752d6dmr5609227637.2.1785866889874;
        Tue, 04 Aug 2026 11:08:09 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.234.41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b0a9csm9922859eec.2.2026.08.04.11.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 11:08:09 -0700 (PDT)
Message-ID: <b062ed85-052c-4c7c-ba84-282a4be2bcbc@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 23:38:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 05/14] i3c: Make dev->desc locking assumptions explicit
To: Adrian Hunter <adrian.hunter@intel.com>, alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com, akhilrajeev@nvidia.com, rafael@kernel.org,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260804133810.184905-1-adrian.hunter@intel.com>
 <20260804133810.184905-6-adrian.hunter@intel.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260804133810.184905-6-adrian.hunter@intel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NiBTYWx0ZWRfX1TqEWvHVOaXJ
 mFpABfNQur3MqctZEOq35uJLPHQL1A2ATUCLsmK3w5zcJs8OUPIGAV/x/1V8WcsQfmw/z4LNDlu
 TjhCwh0eVFm4mIbpnLbUAzKgm35BtiJo/Tm+rFAXcr928R3HbBfdRCGlrNeCacJRhQCPNYWgegj
 3y/i8Qns97BtAQO3RrNJ0sresq1hXWzGH3M8EsD8kzoFM/dqmepfr4jyGO3H55ek92tQcq/qcCi
 YEKo2PrNsHH8i60BBV765okGyu93Y/xNa3MnsQHqEEO9DxhOK0GxiFsOReH2xcx/froYnWAw+46
 76HF+LIXpyDP6MQhMWp8hBdw/Q/BozIQ2YPZFv0RhwmbGqbqW9yKjbJUZXd5/xvNTI1vQJrv9Zs
 cMzCRnlkkA8nXKNe99agxZ0FuJ7EzPuBmLoo67Lr1+pymxMukDn1NzA+SLQZnxC8RnrgKU4HIsx
 SWKpRSZbjwrh9DALweQ==
X-Proofpoint-GUID: 5Ec52TBExFgKDHYBaJwJr1yG9uY9pG9t
X-Proofpoint-ORIG-GUID: 5Ec52TBExFgKDHYBaJwJr1yG9uY9pG9t
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NiBTYWx0ZWRfX9LoEa+wwTUB/
 LlBGBEs3BfZ0iIszpc1o4XubaZcYpt78FMZmqPX0Jmp7IXwvQ7Z87GG+BJ0KBIrS48JkZVpYvx1
 5QG3qqukQaccsVzOc2VQDm2/eGPlJOA=
X-Authority-Analysis: v=2.4 cv=XYC5Co55 c=1 sm=1 tr=0 ts=6a722a8a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=/lQgZcjXNA7ZrIsIl4Cfeg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=RYwuQet4LqFKJ_N4TO4A:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_110811_709394_A38EC6AF 
X-CRM114-Status: GOOD (  14.34  )
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



On 8/4/2026 7:08 PM, Adrian Hunter wrote:
> i3c_device_get_info() takes the bus normal-use lock before accessing
> dev->desc. Under that lock, the descriptor pointer is guaranteed to be
> valid for the duration of the access.
> 
> Remove the unnecessary NULL check on dev->desc so the code more clearly
> reflects the locking rules and expected descriptor lifetime.
> 
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
> 
> 
> Changes in V3:
> 
> 	New patch
> 
> 
>   drivers/i3c/device.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> index a3778282e84c..5e6df6de0283 100644

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
