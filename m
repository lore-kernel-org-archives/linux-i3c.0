Return-Path: <SRS0=XpnT=RA=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA44C43381
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Feb 2019 16:45:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D711420C01
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Feb 2019 16:45:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O5vnZhyA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JPf1YlCX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D711420C01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Me/smRcev8IxTIBYyDtUa5bcHIB1fkJqZ5QAem3KNe0=; b=O5vnZhyA7wqaxF
	r0lUKkujBwRN6q4VFFiXBOwmYCNVhXr4kBLgrcCen0UIFvtD6nY/gm2SFCKzZuQwQeLEY0mdf0FI/
	dSeGrmFCdYs2TeuVziBx19unsCZSWMA4A5HO+HhVwfE7C/R8mQnjrt2nSe0EeS3QM5KpXObI/60HX
	oIU7lyCd1LAlaCaDIgbr6XBErp1otXQtRfLFjVLIz+1/zWkIJy1CpV113019ZJgtH+wHIxBnc/Dcr
	AsJ/v3abu3n1d0o9L/NxmlEUz14wHerNIfJOyyaeLKRx2Rh7j97XWbP7kO78jNU1WNZqZVbx8+AFR
	ZXvpMZCvZH3W/bX7TIlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyJNr-0000an-LG; Mon, 25 Feb 2019 16:45:39 +0000
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyJNi-0000PK-Mm
 for linux-i3c@lists.infradead.org; Mon, 25 Feb 2019 16:45:32 +0000
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com
 [10.12.135.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id B10BF10C18F7;
 Mon, 25 Feb 2019 08:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1551113128; bh=tPPPdnBbbVrXsG2kGBAJw1U1Ly/wa9/HlV5hO7orHA0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To:From;
 b=JPf1YlCXjJJ9Hx613wI8PpQor0LR+qyPxijXTj7jRxqJKpnHTiW7i+g0M/58vl6MO
 frcmMlncGk2LB7jnH0HcJBM4OLPor6zRbTrEEJn4vgLiLgeAzA21z4wX771uHYuOPb
 TNMpCqQdNJW/jh1c2I1xx5rmkydES/Qa7icC5tqD1LJUknjlE4e/EtB19oZe4Gb23e
 NrYNfVcFmP8xeknqL/52u9L+dXUV3aeiq6p4J3ejGTUvzGJrnydzM7d0xCsEUJ2KP1
 ielTVNTKBa27rVaEz4dLlWFQiOZFWY2YOs4Uj/oSqhEGtD0vQ/VRSM1KubTeFy6AOd
 JP+uCrEBgfu6g==
Received: from US01WEHTC2.internal.synopsys.com
 (us01wehtc2.internal.synopsys.com [10.12.239.237])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 355F0A0096;
 Mon, 25 Feb 2019 16:45:28 +0000 (UTC)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 25 Feb 2019 08:45:28 -0800
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 DE02WEHTCA.internal.synopsys.com (10.225.19.92) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 25 Feb 2019 17:45:26 +0100
Received: from [10.0.2.15] (10.107.25.89) by DE02WEHTCB.internal.synopsys.com
 (10.225.19.80) with Microsoft SMTP Server (TLS) id 14.3.408.0;
 Mon, 25 Feb 2019 17:45:25 +0100
Subject: Re: [PATCH 1/2] i3c: Add support for HDR modes.
To: Boris Brezillon <boris.brezillon@collabora.com>,
 vitor <vitor.soares@synopsys.com>
References: <cover.1544702829.git.pgaj@cadence.com>
 <efb3b8692d3579ab3369cc0f80e237550f3e8209.1544702829.git.pgaj@cadence.com>
 <cb17ee91-bad8-03d4-cc9f-e7095cf17011@synopsys.com>
 <20190222155238.3dc4ab8f@kernel.org>
 <20190222150248.GA28244@global.cadence.com>
 <a4d2b1b8-f30f-4c12-a7ab-1bd2bccf1666@synopsys.com>
 <20190225095625.36727da7@collabora.com>
 <6a5570ee-9d40-2c91-4b32-5e030ce94d07@synopsys.com>
 <20190225141029.23afdf11@collabora.com>
From: vitor <vitor.soares@synopsys.com>
Message-ID: <d8d0de00-f48e-f6f2-08b1-85b18ef8400e@synopsys.com>
Date: Mon, 25 Feb 2019 16:45:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190225141029.23afdf11@collabora.com>
Content-Language: en-US
X-Originating-IP: [10.107.25.89]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190225_084530_748394_273E9F17 
X-CRM114-Status: GOOD (  20.70  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Przemyslaw Gaj <pgaj@cadence.com>, psroka@cadence.com,
 linux-i3c@lists.infradead.org, rafalc@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org



On 25/02/19 13:10, Boris Brezillon wrote:
>>>>>> something more generic than what we currently have.
>>>>>>
>>>>>> Something like
>>>>>>
>>>>>> enum i3c_xfer_type {
>>>>>> 	I3C_CCC_XFER,
>>>>>> 	I3C_SDR_XFER,
>>>>>> 	I3C_HDR_XFER,
>>>>>> }
>>>>>>
>>>>>> struct i3c_xfer {
>>>>>> 	enum i3c_xfer_type type;
>>>>>> 	union {
>>>>>> 		struct i3c_ccc_cmd ccc;
>>>>>> 		struct i3c_priv_xfer sdr;
>>>>>> 		struct i3c_hdr_cmd hdr;
>>>>>> 	};
>>>>>> }    
>>>> @Boris: I remember you don't want to expose CCC commands, I think at least for now we shouldn't expose too.
>>>>
>>>> Do you agree?  
>>> Well, if we want to have a generic interface and not force all drivers
>>> to implement one hook per transfer type, we should also have CCC
>>> commands in this enum. We can still make sure the user does not pass
>>> CCC commands before forwarding the request to the controller.  
>> I'm ok with this. Still there is some CCC commands that might be expose for devices and we can decide it later.
>>
>>> Anyway, as for all the other changes proposed so far, I'd like to see a
>>> real use case for this SDR/HDR[/CCC] mix. Do you have a device spec
>>> describing such a sequence?  
>> From my knowledge there is no devices HDR capable on the market thus I cannot argue with real use case.
>>
>> But per i3c spec v1.0 there is no mention that HDR frame shall begin with a START condition (not REPEATED START).
>> So, the question is why do not support it instead of limiting it?
> Well, all depends on the extra complexity to support this case. If it's
> simple enough, I won't complain.
>
>> We don't know the implementation of the device and some of them maybe need the previous transfer (in SDR) to do the next one (in HDR).
> Exactly, we don't know, so maybe we should just wait before introducing
> HDR mode...
>
>> and supporting it we are cover more use cases.
> Are we even sure all controllers will be able to chain things like
> that? 

Why not? for the controllers shouldn't be a problem. The problem can be if it doesn't support.

> For instance, in it's non-DMA mode, the Cadence controller is
> limited by the FIFO size, which means you anyway won't be able to
> chain too much frames using a REPEATED START. So, any device relying on
> REPEATED START for atomic sequences is unlikely to work with all master
> controllers.

IMO this isn't up to us to decide, we just need to provide support and try to cover the most possible use cases.
Right now we only have 2 masters to support this kind of change and I just see some effort to support the CCC commands.

I would like to test this scenario, what do you think that can add extra complexity?


Best regards,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
