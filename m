Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EF9C0219E
	for <linux-i3c@archiver.kernel.org>; Mon, 10 Feb 2025 16:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=favUpkwLSS/yjumPSoukroR0KPmE6oiyT6un3CEDJ5g=; b=Ju7w0vNtWsHkfZtlVrMin5UDLQ
	vLfb8bDlYDjXjHjK2tuqdW/Zfqlx5pbYVaCzWkoOqKaiRQsuXSO/gwJB4w52dyNWrycquqn8+bMD9
	UCjjoBZuQHrDSJIAmeDWrYl1yBPnTGFz9dB0X2nmkBcYvdcu43l9KQnv1YEkbwKNX7dvF5s6boiFC
	5w2mQU0LUc86c2TdVqVQGlziCs3VIBgyS67KVb7FpenK54zT0/LxKcwwc+X7322a/2m4Eeme2CYUR
	wJlIArjj8dAFJXu8E203oamBJu3yPPpl8bz+6BzZ5OpX7Qnnpqpsj3/iI/HVMKdYad5eG5IL5W0Ns
	yuG9S8HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWOD-00000000SIR-3DIa;
	Mon, 10 Feb 2025 16:12:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWOB-00000000SH3-04Rl
	for linux-i3c@lists.infradead.org;
	Mon, 10 Feb 2025 16:12:04 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A96uHC008036;
	Mon, 10 Feb 2025 16:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ovlsn9F30Fw0mJ+hUyiy+C9ddMhEbRMDrmwls+a82pI=; b=kFZS9m9/ioBWHCtY
	1d7MYDui0SC3jhtXICjAxvatoICxpGdIEOUjvCd9zTTfm7VpqJMCyo3qqdzVFxyi
	52bEzChpaDPkca8ok/e7f4MJH1ctM6/uDx/zwBoaezH9iWI+BjQrG4GhsGvZurKR
	1AiVa6lxoNvkU6o5HgM0/q2wZiDlByNJVAlL0yzRfAPdeYitOvNhUyhX7E4fiUBf
	9RbP5pYazyuPc2D07X70xbEz4BEQKyWlrNXZeSKeFMn1JArf4GELhcMvdkivjfdS
	rPKhW19nO9KhoswFfDAjZO7EJZRuqiXy6yvRbj/foaxzEwPj6BX1/P+6jIO9pLxj
	DznO2g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0guvucd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 16:11:55 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51AGBsbu016531
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 16:11:54 GMT
Received: from [10.216.47.54] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 08:11:50 -0800
Message-ID: <e5dcc2f0-df6d-46ed-b341-46de513c0728@quicinc.com>
Date: Mon, 10 Feb 2025 21:41:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] i3c: master: Add Qualcomm I3C master controller
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <20250205143109.2955321-3-quic_msavaliy@quicinc.com>
 <fec85cd8-4c56-4b48-a15f-e7ae08352cc2@kernel.org>
 <e5cad9d0-e602-442f-b216-2f655a9526e3@quicinc.com>
 <1e3a103d-d468-40c6-b03c-723427d7bb41@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <1e3a103d-d468-40c6-b03c-723427d7bb41@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vYpgUUbtsYet6KvVYzwGWPWZ3NDOxJUo
X-Proofpoint-GUID: vYpgUUbtsYet6KvVYzwGWPWZ3NDOxJUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_081203_184922_B6A48AF5 
X-CRM114-Status: GOOD (  19.09  )
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

Thanks Krzysztof !

On 2/9/2025 5:10 PM, Krzysztof Kozlowski wrote:
> On 07/02/2025 13:03, Mukesh Kumar Savaliya wrote:
>>>> +	gi3c->se.clk = devm_clk_get(&pdev->dev, "se-clk");
>>>> +	if (IS_ERR(gi3c->se.clk)) {
>>>> +		ret = PTR_ERR(gi3c->se.clk);
>>>> +		dev_err(&pdev->dev, "Error getting SE Core clk %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	ret = device_property_read_u32(&pdev->dev, "se-clock-frequency", &gi3c->clk_src_freq);
>>>
>>> You never tested your DTS or this code... Drop
>>>
>> I have tested on SM8550 MTP only. Below entry in my internal/local DTSI.
> 
> 
> And how is it supposed to work? Are you going to send us your local
> internal DTSI? Is it going to pass any checks?
was saying about code was testing with MTP. DTS was tested using 
dt-bindings check.
I should add "se-clock-frequency" and "dfs-index"
> 
>> Do you mean to say i should add this property in yaml too ?
> 
> Yes.
> 
> You cannot add undocumented ABI. That's a strong NAK.
> 
sure , adding both properties into yaml.
> 
>> se-clock-frequency = <100000000>;
>>>
>>>> +	if (ret) {
>>>> +		dev_info(&pdev->dev, "SE clk freq not specified, default to 100 MHz.\n");
>>>> +		gi3c->clk_src_freq = 100000000;
>>>> +	}
>>>> +
>>>> +	ret = geni_icc_get(&gi3c->se, NULL);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	/* Set the bus quota to a reasonable value for register access */
>>>> +	gi3c->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
>>>> +	gi3c->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
>>>> +	ret = geni_icc_set_bw(&gi3c->se);
>>>> +	if (ret) {
>>>> +		dev_err(&pdev->dev, "%s: icc set bw failed ret:%d\n", __func__, ret);
>>>> +		return ret;
>>>> +	}
>>>> +	dev_dbg(&pdev->dev, "%s: GENI_TO_CORE:%d CPU_TO_GENI:%d\n", __func__,
>>>> +		gi3c->se.icc_paths[GENI_TO_CORE].avg_bw, gi3c->se.icc_paths[CPU_TO_GENI].avg_bw);
>>>> +
>>>> +	ret = device_property_read_u32(&pdev->dev, "dfs-index", &gi3c->dfs_idx);
>>>
>>> The same. You cannot send us hidden ABI.
>>>
>>> This code does not look like ready for upstream. Are you sure it was
>>> internally reviewed?
>>>
>> yes, we have taken 2 rounds internally.
> 
> 
> And none of the reviewers spotted undocumented ABI? OK, learning
> experience for me.
> 
> 
>> Are you saying i should add this into yaml ?  what do you mean by
>> hiddern ABI ?
> 
> 
> Where is the documentation of the ABI?
> 
can you please point to other ABI document so i can prepare and share it.
> 
> 
> Best regards,
> Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
