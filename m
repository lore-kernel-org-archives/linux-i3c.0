Return-Path: <SRS0=HGQP=4J=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7E0C35656
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2020 15:36:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46C5F208E4
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2020 15:36:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bCbbRW9H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46C5F208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+nVZAvYJv3bazLMsQVecwEJ1oBQsku9aW7sfoV7JHNk=; b=bCbbRW9HYwg31T
	yRTPAGjcYw6kVdCWm3BaBz54nm9nkir+ZgNfXPD4at0G2qzhwRMYgxeGCpkBmnBt50siMcA8qJUW/
	4KBPrGyNildkERe8eMu361Ds/iZKV3jF3i+d5LIbizWK/VCNHJrTqoPKdcNWtgdKRJQ4hbeOW+T2U
	EqOcoa/G9eyaW/WFu/2pbyEO9JIYuj6AihIvZbJPtqqBgOdsgRIcoTMAisjcbSB7vZt/CWeXchujR
	/PE7ebnpdp2e582c3epNJQnst5Bq2lFrngK829rLgB5N0N0lv65gjSPrTvQ4TfaSpONCdWq5lz22l
	1gkOM4TtmcKKLJ5VBVtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5ALy-0006MV-Cm; Fri, 21 Feb 2020 15:36:34 +0000
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5ALw-0006Lr-NS; Fri, 21 Feb 2020 15:36:32 +0000
Subject: Re: [PATCH v3 5/5] add i3cdev documentation
To: Vitor Soares <Vitor.Soares@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
References: <cover.1582069402.git.vitor.soares@synopsys.com>
 <a6f65d23947070f52c43fee4a1427745ea675ae0.1582069402.git.vitor.soares@synopsys.com>
 <13770b93-d98b-81d7-0cab-92daf9151ee6@infradead.org>
 <CH2PR12MB42160E59DE750C4C4242E6E8AE120@CH2PR12MB4216.namprd12.prod.outlook.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <994bfe97-af31-3423-c293-2beb75e0406a@infradead.org>
Date: Fri, 21 Feb 2020 07:36:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CH2PR12MB42160E59DE750C4C4242E6E8AE120@CH2PR12MB4216.namprd12.prod.outlook.com>
Content-Language: en-US
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, "corbet@lwn.net" <corbet@lwn.net>,
 Joao Pinto <Joao.Pinto@synopsys.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "wsa@the-dreams.de" <wsa@the-dreams.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 2/21/20 2:31 AM, Vitor Soares wrote:
>>> +BASIC CHARACTER DEVICE API
>>> +===============================
>>> +For now, the API has only support private SDR read and write transfers.
>>                         only support for private
>>
>> For the unfamiliar, what is this "SDR"?  (thanks)
> SDR stands for Single Data Rate. In I3C we can also have High Data Rate 
> (HDR) modes:
>   - Double Data Rate (HDR-DDR);
>   - Ternary Symbol Legacy (HDR-TSL)
>   - Ternary Symbol for Pure Bus (no I2C devices present on the bus)
> 
> Should I use Single Data Rate instead SDR  for the first time?

Yes, please.

thanks.
-- 
~Randy


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
