Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACF1C5AC67
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Aug 2026 18:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7LFfECcYt0tKK7y9Za3vwNweia+ufc3HRlY9pAAdoTY=; b=hlpyBy65OuonOq
	efnMsVvthRjzopMsTH9y4uVvX0cydIDYIl2vUf3ItM7odzeN072BdnbTh1jBBiYfe/WYzXMX8+D3t
	6fau7HyaiFn7QP7dZ6wwBE7o8uyuqR8YzZbFFav+w4smdINxpAoQaMvGevy0BfA8nd7CwhV2LbBqs
	cNzxrGRtiruCx96h47ht0iyygDEdncr6l9RfoeDAwibgwB1BOz8L7VYZbDsiLC6eBmmuUUzpHFFfP
	Ln5SZNTHLxeToiKmJogtiU/VnZi54IOlyET9IGgrRNvwBKVfiH5OTGGn7Noz+krHmMq00zDESBxvZ
	6IEAe+3TduWaOWTt3hAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws3If-00000006XEC-256k;
	Thu, 06 Aug 2026 18:58:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws3IP-00000006XD8-1aX9
	for linux-i3c@lists.infradead.org;
	Thu, 06 Aug 2026 18:58:40 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676IHrS02704600
	for <linux-i3c@lists.infradead.org>; Thu, 6 Aug 2026 18:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zgbu3G2VLkPkBKrxyAQV+vTmrYMaFpJkZeNb7gwNxCI=; b=iwQTIkR2VXvbdkEk
	3qITKPXvhxLYxnBvZUpGVmVkqymLj8GgS+W82BfcXF1sJdYia75dV/nGb71H9Ood
	C4CtWaktWb828zuvZFkA70eK+/ebS99R+sUoKcCwJQOMiNBNfzbVAHHSk7ywffXi
	jqJEa3dF1yB4L3Ast8D9BrjU6JnMBsTwQbDfc44SWjknfh8Ri7Pvtilb27XCo2nK
	Kng2358V0WBrb9QhsA3bkJSnfqlRHJuI9pG94MuIbd0w9W5uaTUsiJ8Xll+NP1D0
	gfBOmHR9AoSKorEySnWakXQpNLeanSYEetf8MEUBTx5Wk+PT4GGaE9tzA/5w1zPP
	NGgYig==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6h88xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Thu, 06 Aug 2026 18:58:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso2629523a12.2
        for <linux-i3c@lists.infradead.org>; Thu, 06 Aug 2026 11:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786042695; x=1786647495; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zgbu3G2VLkPkBKrxyAQV+vTmrYMaFpJkZeNb7gwNxCI=;
        b=i7X2BbTGd4BkJ8GZ6A85UF8MCbv44tBUshhpJtQLMHig29Dv4Yxa7/Do8KQD9aFPWU
         GkU1C+65wf5KLOz6QW9bnToN83pZ3yBSUm8KHjUBjoFzwsD6FG3AJMHNGj92PA07fSBy
         Xe1BUtzcZW/y7vFPAEWbTjvyJN6nEP09mPYxXPbYD8D4/ySs5Qm0YQGThCcJVSzHvKS6
         ueynOX8WHyk6FnSogIqLrQw7WDu36fatLpcfuF8fqqaLqkWmV1hidfESkBGZim8LKBPK
         Ip2veBWPjlYzvzd65uHUX2F/2jBHbFBsmdiGPNRh7bZNVLo4GcnnrOpH0FX3Htv+z/g1
         08PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786042695; x=1786647495;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zgbu3G2VLkPkBKrxyAQV+vTmrYMaFpJkZeNb7gwNxCI=;
        b=DOEtEONc0JqrCjPY2MhPj5wLkESMsJJfn39dtKiVAlRQR0eXuRa18x7RB/QO+S4RUe
         5vETf1OpeUHgHe7H1vsDUPpFVtEcrXizSzK7feU3RGXSyWEzY2mBKV0m98TpLeMnTQ/u
         8Ic2/s/EtCn+Pmf+4eEPHriyD/EPFFqoElWQkrmFl+fmEprS64y1/M/IeKNhnYlYICAI
         0X1nq1hsxGVJoDc42hY9gwHfMBfdUc+K/VfPXC67qAdeU597ct9bacCpbnipQ+5bzuWB
         po38eMlFEB3/pDwe2Ml/x9OWuWb9096MKnQB1DRcoAxzIk44mY+inzSTfPkLqbkCtzMp
         kU5Q==
X-Forwarded-Encrypted: i=1; AHgh+RodiW5et5/Cmu0//mgKY4gz0cTa3WyAkeBUTLrML5b9R3lp6dpN9EG7N/F91d7tyljC4mc30TmjLXU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3w3SzUiZXv0GQn8D2WdMIFkuvsx5B3TGBR4ABCOIlbqGqGk3+
	ceUNi0oHFoaSpyZvxHn+/I4l5+8hY19hJIgdB8kUKqEk6iasL+Mr9Yp6NLjh/Q14Zg0sCNhbru+
	go44M8/3Z9r5R0rTO5lj0tWzhmsnPHkgcynhC8m/8bZSCbBOSqUK/fhaO3IZq0Q4HX7tJ
X-Gm-Gg: AR+sD10rnXxZU19lKTCOmxcAd1vU0jcwzW7ooN2/x4Nx2KBWKoRx7YFg8hejOUY1gwA
	syQPfA20qExM/2JMet361HKxspN+62yAgQWq13MugdZvjg3V4c7I6hDVfMEWTXosTgTwpwTV8qi
	xlqlpWcNriUamYWdJ3OsIdWFF+a1cPCKDzZ++3qL1FzGnpO3aFrN92T6ehIgNxYIy6mVN7Mtn+u
	b0Kojy4QKdEhJVpH7iCboFFOJ4zSra4oRcNL8RcD05EpzqP3MdFGzx9MD9kdP41Nb4edDbTnos/
	lpxLMwEXvVNA43wPWip/d31B0w10k/eA3R0n2vzhYMzmr/lVFnJb3xbcbmhZ26psKMwPKBe5b7T
	NaJSpF8Bg15FfLvHDZHhvpQK1fAVlXKFOVA==
X-Received: by 2002:a05:6a21:6005:b0:3c3:724d:ae7a with SMTP id adf61e73a8af0-3cb85dcc94fmr22487505637.9.1786042694650;
        Thu, 06 Aug 2026 11:58:14 -0700 (PDT)
X-Received: by 2002:a05:6a21:6005:b0:3c3:724d:ae7a with SMTP id adf61e73a8af0-3cb85dcc94fmr22487465637.9.1786042694212;
        Thu, 06 Aug 2026 11:58:14 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.231.86])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14100a3bd95sm460596c88.10.2026.08.06.11.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 11:58:13 -0700 (PDT)
Message-ID: <4d82ed04-81af-451e-982b-48fe001d0863@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 00:28:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 08/14] i3c: master: Support IBI-based wakeup capability
To: Adrian Hunter <adrian.hunter@intel.com>, alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com, akhilrajeev@nvidia.com, rafael@kernel.org,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260806131857.119830-1-adrian.hunter@intel.com>
 <20260806131857.119830-9-adrian.hunter@intel.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260806131857.119830-9-adrian.hunter@intel.com>
X-Proofpoint-GUID: cCeJzyGUoI3cE8ZvQFI8LUGyOyQME2Fx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE0OCBTYWx0ZWRfX/uL10fyHIyyd
 UydVM5675jshTP9DwqPL96oi3UZEdGbudEmRGnzdkTE3UN3cSxEUAagihyHXg1TIafUGoTfE7AM
 hrmpvDww82eUJCEIlBwdXq1DoAplA3QWK/xbgTNg8yfTCOn8n9vpcWB3G5D+XCEBiIfxwwlf5yq
 V1A5o6VXAoaL09CrFmV8W9bTSohu8sG9mdD+L9Iy+k9Pg6MZj7wm2l2odPTXuw6cpU0uDu2Pcd8
 Wbqf9TJTYJx9IEs60LnaLd2TQjk0LDBGERArNMzRgr0vXhMm7RJZ1WWm4wAva+JUqUv/bmbtdBk
 ggbRVfwGRt+3p/tVCi9EJbgkgmLUQUPGiu/csAUUiOKs1r9UeSuUMq/6HM+65lvghNxdqi7dXKL
 pGJg5WpEcAlyyu4ePtBn/XrNylAyI9arolqaey2IuPgNFmyASCiJ21JICB8p91Jsirp7MUNZRw8
 nuuLlFroyRqA9GO8GJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE0OCBTYWx0ZWRfX/XFygPBQWFJO
 oqyUUuU1nnwNJykmNrhTjdB/fcIcsMg8OA80ak8FLXw0gVkzq6G83ZXGAmDv36jaxBzZ/3hkniU
 Y731SuUJ9htwXMghux7WbmwUzWHT4U4=
X-Proofpoint-ORIG-GUID: cCeJzyGUoI3cE8ZvQFI8LUGyOyQME2Fx
X-Authority-Analysis: v=2.4 cv=MbpcfZ/f c=1 sm=1 tr=0 ts=6a74d948 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=uB10XSru4U0CyR2DWkO06w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=QyXUC8HyAAAA:8 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=w8-nw_vHdxPODZekXkgA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_115825_541178_603533A7 
X-CRM114-Status: GOOD (  11.49  )
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
> An I3C controller acts as a bus controller for one or more I3C devices.
> If the controller can wake the system in response to an In-Band
> Interrupt (IBI), then any device on that bus that is capable of
> generating IBIs can potentially be used as a wakeup source.
> 
> Add an ibi_wakeup flag to struct i3c_master_controller so controller
> drivers can advertise support for IBI-based wakeup.
> 
> If set, mark IBI-capable I3C devices as wakeup capable when they are
> registered, allowing wakeup management through the standard device
> wakeup framework.
> 
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
