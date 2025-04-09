Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3873BC36002
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Apr 2025 06:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gVvWhlevcKHGnsPXg0ZlQcyex5ax6iqiBElm2ApJnuI=; b=nj1OGa7bUPkghd
	1BfMumZeA3R46oH3s5v71m6REKVy4EO4Xx/QAkxXYyt+Z5wymQr7yXy22lh/rz4OWuzZ7+mZtL9fF
	gVr2CaSfY5jAF3++0OaM4BTnDU+n7dmOAazsLfer7B9AC6J31TflCJhiwYb2pXkM3Ga+uCEtps5eN
	D59/bj7EQSMH+GFLsFUqXfDshCi648s7Ypwdc4hwk/0ne9EDSd5sHcPrIM4Aht323WuxxuU4Vkt5v
	aRFjTu/hCi9tJddPKh0ylFNFsYfNplaPC0SFRcM6RA6O/FvTX5gFbE/pBXtBQhc468obU6LvfPAn9
	wi2ANO1P9PuWHGvij5gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PGa-00000006KNQ-22xg;
	Wed, 09 Apr 2025 06:50:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PB2-00000006JUR-1iBJ
	for linux-i3c@lists.infradead.org;
	Wed, 09 Apr 2025 06:44:49 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JZRFo002911;
	Wed, 9 Apr 2025 06:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MjxU9Wzug3C1/bpJyyVdvYu7XHV8AaWbS5sG+EoQisg=; b=FS0up6cHnaMXRdel
	9xohDLWDiERagrmdD2sjPcXzDCYYzas/GQ8E5gDevQsgaeS4pGIdmRlvYxpUlSuZ
	R5BaoHMcje/gf+9X47yjBQlf7B9coFlPEU+JD2S7yKW7K/bJDLlylxueQhKbjL+a
	ejQUHdbnw22TleULY/joUcPkNlU1vZfFR1JcwM9VqjYmAxCGmCl3DvJFvOs6ETT+
	b0lDwrXz+wUImMQcsoSR75LjNY091FoECm9LAbUF6GjKtReWJiXfeQk0zRjatBGm
	Du5t8lxpC4yreAJvAioOeHJxATtqHr/bhi0GPcj3+UjjCGsITrdwx8bVvTAduiI0
	S4v5Tg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1j7tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 06:44:40 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5396idmU014141
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 06:44:39 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 23:44:36 -0700
Message-ID: <c4994d69-a8f6-40ca-96e6-6cd9ed2081ae@quicinc.com>
Date: Wed, 9 Apr 2025 12:14:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <alexandre.belloni@bootlin.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <linux-i3c@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
References: <20250403134644.3935983-1-quic_msavaliy@quicinc.com>
 <20250403134644.3935983-3-quic_msavaliy@quicinc.com>
 <20250404-provocative-mayfly-of-drama-eeddc1@shite>
 <4fe9f898-63bf-4815-a493-23bdee93481e@quicinc.com>
 <e93c50ce-30dd-45ef-b945-019e703bd7c3@kernel.org>
 <6ab62bb9-2758-4a12-aec3-6de9efc3075a@quicinc.com>
 <7bbe235d-be3a-4851-b9db-c3c9e956a9fd@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <7bbe235d-be3a-4851-b9db-c3c9e956a9fd@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RcLhxEaQ9o46zmtvil6I3QMZoz8pGOz3
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f61758 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=yBufkzId0ZbioYoeXs0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: RcLhxEaQ9o46zmtvil6I3QMZoz8pGOz3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=706 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_234448_567876_0D0A37CD 
X-CRM114-Status: GOOD (  25.84  )
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

On 4/9/2025 11:40 AM, Krzysztof Kozlowski wrote:
> On 09/04/2025 07:48, Mukesh Kumar Savaliya wrote:
>> Hi Krzysztof,
>>
>> On 4/9/2025 12:11 AM, Krzysztof Kozlowski wrote:
>>> On 08/04/2025 15:23, Mukesh Kumar Savaliya wrote:
>>>>>> +
>>>>>> +static int i3c_geni_runtime_get_mutex_lock(struct geni_i3c_dev *gi3c)
>>>>>> +{
>>>>>
>>>>> You miss sparse/lockdep annotations.
>>>>>
>>>> This is called in pair only, but to avoid repeated code in caller
>>>> functions, we have designed this wrapper.
>>>> i3c_geni_runtime_get_mutex_lock()
>>>> i3c_geni_runtime_put_mutex_unlock().
>>>>
>>>> caller function maintains the parity. e.g. geni_i3c_master_priv_xfers().
>>>>
>>>> Does a comment help here ? Then i can write up to add.
>>>
>>> I do not see how this is relevant to my comment at all.
>>>
>> What i understood is you suspect about lock/unlock imbalance right ?
>> I know that Lockdep annotations will be used to check if locks are
>> acquired and released in a proper order.
>>
>> You want me to add below code in both the functions mentioned ?
>>       lockdep_assert_held(&gi3c->lock);
>>
>> What exact sparse/attribute can be added ? I am not sure about that.
> 
> I don't think you tried enough.
> 
> git grep sparse -- Documentation/
> which gives you the file name, so:
> git grep lock -- Documentation/dev-tools/sparse.rst
> 
Thanks ! it seems little more deep to go for me. Appreciate your 
pointers here.
> Use sparse instead of lockdep.
> 
>>>>
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	mutex_lock(&gi3c->lock);
>>>>>> +	reinit_completion(&gi3c->done);
>>>>>> +	ret = pm_runtime_get_sync(gi3c->se.dev);
>>>>>> +	if (ret < 0) {
>>>>>> +		dev_err(gi3c->se.dev, "error turning on SE resources:%d\n", ret);
>>>>>> +		pm_runtime_put_noidle(gi3c->se.dev);
>>>>>> +		/* Set device in suspended since resume failed */
>>>>>> +		pm_runtime_set_suspended(gi3c->se.dev);
>>>>>> +		mutex_unlock(&gi3c->lock);
>>>>>
>>>>> Either you lock or don't lock, don't mix these up.
>>>>>
>>>> Caller is taking care of not calling i3c_geni_runtime_put_mutex_unlock()
>>>> if this failed.
>>>
>>>
>>> I do not see how this is relevant to my comment at all.
>>>
>> same as above
> 
> 
>>>>>> +		return ret;
>>>>>> +	}
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static void i3c_geni_runtime_put_mutex_unlock(struct geni_i3c_dev *gi3c)
>>>>>> +{
>>>>>
>>>>> Missing annotations.
>>>>>
>>>> Shall i add a comment here ?
>>>
>>> Do you understand what is sparse? And lockdep?
>>>
>> Little but not clear on exact sparse attribute to be added. please help
>> me. if you can help with some clear comment and sample, will be easier
>> if you can.
> 
> You did not even bother to grep for simple term.
> 
No, mine was quick research, what i got is below from my search and i 
mentioned in crisp. What you pointed above 
Documentation/dev-tools/sparse.rst looks great.

===
Sparse and Lockdep are tools used in the Linux kernel development to 
help with code analysis and debugging.

Sparse
Sparse is a static code analyzer specifically designed for the Linux 
kernel. It helps developers find potential issues in their code by 
performing checks that are not typically done by the compiler. Sparse 
annotations are special comments or attributes added to the code to 
guide Sparse in its analysis. Some common Sparse annotations include:

__attribute__((noderef)): Indicates that a pointer should not be 
dereferenced.
__attribute__((address_space(x))): Specifies the address space of a pointer.
__attribute__((force)): Forces a type conversion that Sparse would 
normally warn about.
Lockdep
Lockdep is a runtime lock validator used in the Linux kernel to detect 
potential deadlocks. It records information about the order in which 
locks are acquired and checks for inconsistencies that could lead to 
deadlocks. Lockdep annotations are used to perform runtime checks on 
locking correctness. Some common Lockdep annotations include:

lockdep_assert_held(&lock): Asserts that a particular lock is held at a 
certain time and generates a warning if it is not.
lockdep_pin_lock(&lock): Prevents accidental unlocking of a lock.
These tools are crucial for maintaining the stability and reliability of 
the kernel by catching potential issues early in the development process.
===

> 
> Best regards,
> Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
