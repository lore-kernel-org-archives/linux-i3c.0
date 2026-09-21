Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCB0C982EE
	for <linux-i3c@archiver.kernel.org>; Mon, 21 Sep 2026 20:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HwN+ekml7u8IVuauSXiVAc0Wk/a5AGOFsLpPc3LA1WI=; b=rZtrYX9IrIzI02
	fJGF1LhdUkldM26xIZBwxvgNKyFioRjcn+4ixDpL22daQ6EoYtMjj1sIpHkbwamr59E5We5lNIw1X
	mroP9Fgm8je3mhZ0GkRPZf/BIHeiaZk2zuxqrTpu7jAGU3e10fBkPGnRPj+Hgcg9ed79OBh6CFtM8
	NKEf9A/lY5n7z4O8l7Q5j7SUAvaHhYLtXSSWzNsPKe0q/8MHF0l3abUKRfNHTQ+LBFmXwW0SQlD+H
	O7QbdFpxHFTNcd726xNR22AN3o93yj9IJaJRvGXBJJTih8rFjPvzgRASO7u4nlH1k/ZBCT8OtKKCM
	dkU7LJBGQ2Ank1F7hyyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kce-00000003LET-2fnS;
	Mon, 21 Sep 2026 20:28:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kcc-00000003LDx-3V4g
	for linux-i3c@lists.infradead.org;
	Mon, 21 Sep 2026 20:28:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LHIHAQ2981019
	for <linux-i3c@lists.infradead.org>; Mon, 21 Sep 2026 20:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUxMPqFTkctfTM0ny6G3bUl1Gi6PHwngLAZs5CaMeMI=; b=jH4Ft6TmxNUtpqz3
	GFzeyGCZQLrHj2pW+G4INc88sXK8cm36ZPUPS5XFm4mv7IqOeGooKJr9bsDHli1o
	GZ0MslftByyfTEmaquzDtVWs+nf3NhbAoRr/2iSByYgajXyXEw3TtgFHR4qyxNeL
	WUSAo5QyQVRwgOIUJI8vU01W8GTuroNzrExRD2NtwNttTLopFXuHCm8H0VmR3t4a
	NkKRglJm0AIfmzVgdKhudJZUU998774x2dE31/PFrKGEksBYA1vu1h+x08mVcKbX
	TfjMD0qsn82xfc16IXgSsbP1Q+vfkr3Wu8ll38FhM3wVKi0XyTe6gegc2QQt9PZN
	76Umcw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8v50qfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Mon, 21 Sep 2026 20:28:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso4517540a12.1
        for <linux-i3c@lists.infradead.org>; Mon, 21 Sep 2026 13:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790022493; x=1790627293; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lUxMPqFTkctfTM0ny6G3bUl1Gi6PHwngLAZs5CaMeMI=;
        b=fLAuQqQcfetx0uk3RdvMV+e7RtgknHCXpEcwOlwPN2VGxBzyB2SBYml7OI6ViSrAZN
         tGZnhW6jPr7Q9jwekgUTBN9mMoxu47DYKLu+V9gzLTZQnKcftOuKeZsbvlseLa3B4StN
         CZl4uw8MTAI6islUqYjkrwOXUbjORUSZiUR4rbYc83jJpwG5jCD6hVwyqGpMhp6Hq/nQ
         tvbemd4ApTMv77nb/Oa1RZEgUAGvFr6tMFJEX8xywr1vFTodLwFCIVeebT6UHA9sIJhb
         fMoUPTFIccOXFHoVaxh6Ojrqxx8QWlg549OCerVCS71N7aG9/6vsL1TSg8LtOei/jeWm
         MjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022493; x=1790627293;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUxMPqFTkctfTM0ny6G3bUl1Gi6PHwngLAZs5CaMeMI=;
        b=Dq7d9FvOqnKnFsQ2ZS6w/rqmhhAvWjYdHeGB3amzv1XKoGklYzVWrZgDQ+Ju14KHib
         O1r2NBl1o86D9z1XaR64G0VPciaNQQ3Sy2P7GR4cT87FlAjYXB1+0HlgIGTsXYSO3Ibv
         Ebea4Kr4IBqjlxLpod0zFn5JpD97IQ1fJ7Mapum4mMhiuH3HI8DACcYWDDkZFSGKshOr
         duVCAxKtICFc3BdnIjhIFEJI5+IPwHKYLt9HQQSoPskSC9c/FCmTbtG/CS8nwOM1Mwgb
         FGsaGpn23wh5hjMM5khiZd2+NcRTNLB0CARDNik5/5Q2IdjUf98q50JL6yo0+rPUvJFz
         5uZQ==
X-Forwarded-Encrypted: i=1; AKwUvByEJEz8gGh1OFUueIhXjKcYNy+z21iurRw0W6MAxUFrAyubrPfDX+bOaXlegNxGavIjbXB++wvAZC4=@lists.infradead.org
X-Gm-Message-State: AFuF++nAB70PSpG0MzsFjEMZe5ZWgzK3PGscUC/4FtqAQr10Q2rtLJ2o
	aBa1KO049PWddmOxHTUtsTVWUs8RYIEXur7TwF3uYJlck7EJB0X9E9rgwLMiI5K2ldftOoFm8Ql
	h5GtvANMCOszEG1DQ3PvPDVcx82DEU2RKRMybjMwb9m9ky1w6cGynd/dKvIKBe3tz1Rqp
X-Gm-Gg: AYBFou3esd3FSdjIb1CF9eL3NRa6TbZmgKS+kixKHw63Pn0jtBNj1b5OBNME+KahIEi
	VY5FDs9MtgZANUZ2HyWkZF16dv2ZDEG7KyC6wtWYPLTNAJ/glslch74lCyC1YHTgT1gMQPgWaLI
	/F1ns4k7nURz4j7R3wyT+pk8qQoMuMCzSXur0LvqkCAHBm08lSHQ4DiCPFBYcTw9VDLcUfikqwh
	IvArjv4m3GUeM1Pye6WxLwLjSnHXU5XEHsHUPtliQOfTebhYw7XRSI878USAqUCuw7ZK/avrqSw
	RnVZ+01tlkLH09s2DBHBVMmEGkjZIbdGSXSvrFhfUSKMbZmrND3NRVhivDn3Am2Tn02w0E5XLn3
	6KESD8tR0aoZOisy/5O3um9CB/m46loUP
X-Received: by 2002:a05:6a21:1b81:b0:3dd:a196:5395 with SMTP id adf61e73a8af0-3dda1965403mr11871517637.55.1790022492701;
        Mon, 21 Sep 2026 13:28:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b81:b0:3dd:a196:5395 with SMTP id adf61e73a8af0-3dda1965403mr11871484637.55.1790022492079;
        Mon, 21 Sep 2026 13:28:12 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.229.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5eba13f5sm396926eec.10.2026.09.21.13.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 13:28:11 -0700 (PDT)
Message-ID: <c9c9c069-d8e8-4921-8007-6c6386c8da7c@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 01:58:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Frank.Li@nxp.com, wsa+renesas@sang-engineering.com,
        alok.a.tiwari@oracle.com
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
 <ce888443-c86e-4353-a4e1-64f2cc62604a@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ce888443-c86e-4353-a4e1-64f2cc62604a@oss.qualcomm.com>
X-Proofpoint-GUID: VAHwaQYmZzpQ2DnyyyBlSGIMaoYU9LSF
X-Authority-Analysis: v=2.4 cv=B+0sQ+tM c=1 sm=1 tr=0 ts=6ab19361 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=LKvw4eQ66EqDTtCUdPbf+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=lq1buquVkbxOhH_QKIUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI5NyBTYWx0ZWRfX98649j8JxGq8
 lAz9k2Du+5fnDeU6lTTqNKACPAWXzc/811SiTivka2Es2dLL2K5J165dBDIdbTyY6JSRq32TI09
 xd4c8HHWsntJaRy9k6+MO9NP649KgsY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI5NyBTYWx0ZWRfX4HY/TbohzJQw
 lNe6N2lVgGsK6+D/DIO9mtHzhaL/ZDcPJJmyU5CSaJAB4I8b64UkTVbxiC+HEM7APOqKZfcJhoQ
 jTGVj6awFzdXsv3Vzn8KBW8zRyRE8xG9yVOoquHIeSYi5Npi7tf+skttWm5nVH9POAsUPAYTMSq
 0yd/D3n6q1h6cvn7ak3qk1LArZ9NX+0GkRSKOWqJ54dbETOSWVvfDz/P0viMctBdlN4WbfieRlY
 iGKS6VEms38N7rPnY+eWkQoDcFzCxkbmvyviHmGAUmT3ZSGjSKvRQ/WugCF5Ud9XtyXJeJhjnOs
 GBRh05zeqmrEZBE8p7ofpW8YjpuocpiVToBuaXnTnKoJcdB2SnVY7hS9zoVLYwgrkKIuT1tIRDB
 3Epyn0LZSf9x8bhrTe/0wqp4ZtxP664Tlm6s3PVOTeYgqolC4pASC+u7jT1EndYW+Odj6n4EbXa
 65xS5JxEe6E1VpuwAog==
X-Proofpoint-ORIG-GUID: VAHwaQYmZzpQ2DnyyyBlSGIMaoYU9LSF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210297
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_132818_904150_CB7BD435 
X-CRM114-Status: GOOD (  15.85  )
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

Hi Konrad, Apologies for the delayed response. I was waiting to verify 
the changes and ensure all the suggested updates were properly 
incorporated. The effort was further delayed due to some slave-side 
setup issues.

I have now addressed and validated all the suggested changes except one, 
which I have responded to separately below.

On 7/18/2025 2:21 AM, Konrad Dybcio wrote:
> On 7/1/25 9:18 AM, Mukesh Kumar Savaliya wrote:
>> Add device tree bindings for the Qualcomm I3C controller. This includes
>> the necessary documentation and properties required to describe the
>> hardware in the device tree.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
> 
> [...]
> 
>> +properties:
>> +  compatible:
>> +    const: qcom,geni-i3c
>> +
>> +  reg:
>> +    maxItems: 1
> 
> In another patchset, you expanded 'reg', can you coalesce that change
> into here, so that we don't have to worry about backwards compat?
> 
Do you mean as below ?
reg:
   minItems: 1
   maxItems: 2

I did it earlier to add support of IBI feature, but i plan to do it 
later. Right now, i only want to add plain i3c controller support 
without IBI hence.

I shall add expanded reg while adding i3c support. For now, its not 
required. Please let me know if this is fine for now.

> Konrad


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
