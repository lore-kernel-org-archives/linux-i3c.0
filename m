Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D1CC982FA
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Sep 2026 09:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNoGqVKtiDG6Ck5ivXEVuqGK5HROKpEgc+VMsbOaypM=; b=1CGA52WJ8F1bAj
	jSoNclPz/Gvv5oiWjuvnfdJv42pmIUBGfJnk3B5OdaYO+qC8vgV6g/+HSR/k4QMoVAHGNcXa6AaK6
	ye8EoRKACVfFHSfINAMO6sxKT4zbvbiCKgrkFol+QUHSf2MKUuzKl1yLHYHczN2EXsDaJIMJqfYOY
	n+HqGoLV7PDhHXIqpuuYwy4HC9ooX8V5Tq2cLVdbH4dOK5uTxjM0/GgLGEGQRrDNCRo5yZ4WjEr03
	wYHIvsmVZ2vMkjfhzzZ4HGpdpp8AMHE/K8Lgu1IGC/mdkybu/T80rSvMnB4BgfMwWxHo0ffpRJuAW
	Nin/bfQDMiMdVrnZhcSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wcc-00000004tLw-2GSr;
	Tue, 22 Sep 2026 09:17:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wca-00000004tKE-44up
	for linux-i3c@bombadil.infradead.org;
	Tue, 22 Sep 2026 09:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=COqmZ9blzsdE06kCsTbYVCP8lIXdluTDk5+2o3BtcU8=; b=MufVVOuPBDNtDn+MNDDRG78VGE
	s5YlOAIK42+qBlWZklqxqIS4cd87Pkim5YGY+eTjVRbUnd3L6bWJJV7WLKT+hn5H7cJhaM3cbkZIx
	1Nm0s6GK3FqcJ0cJ0QoEsWnobVls+1iAk6/psYH3eUWLutdvUOlqp4YZJlUtCQZNHGZX46IcRdZGc
	P7q7e0lESsvss7Y84EIZx9jBIoJDuwUHTRCxhBUZaA0bcYOYj718f5z/kZ5wExaBypRNHN0ZcQPTO
	dxgQMPORbNNMNLpWVkIGvvtY3zw+f8Ob9fZ07524BfgjL/UixQJ5KFy6BHixi5N6lYKuCdIe2PqsQ
	Y1nJTBcA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8wcV-0000000DLkN-1jXS
	for linux-i3c@lists.infradead.org;
	Tue, 22 Sep 2026 09:17:02 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68M9G7X503502099, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1790068568;
	bh=COqmZ9blzsdE06kCsTbYVCP8lIXdluTDk5+2o3BtcU8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=lZdHcwJyA0E3ZPLZ5wfAyCqMN6WkkJ7SmU2iR10JiJsbn+CUCBEHd+rayolAHR0/4
	 ncMtgh54sH3hs5g01OQJ10UsuScjDZqCG6pae8AlHW8oJOFmNwsI4o1oVxf6KX2kR4
	 7eg32c25/vcLGdwsjhvaaoB3eQxg78KsgdcvKYFnYs3KGy2dGj1DkEYsO5fMG6fx5p
	 sXp+ufHs8L+h3/6VgIFzih5V0KUwBvU0fISvqEHRc76NINAJfQ/7K7Yk5vQWwP1Ea+
	 ZQ3v5AiKA+VARmxeCyuwFDdchWyz8lGzB9rBj50Br/RWgYSTOUvh9xQmA4lK0Z9G4O
	 vbEntYTo5bwEw==
Received: from RS-EX-MBS1.realsil.com.cn ([172.29.17.101])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68M9G7X503502099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Sep 2026 17:16:08 +0800
Received: from RS-EX-MBS2.realsil.com.cn (172.29.17.102) by
 RS-EX-MBS1.realsil.com.cn (172.29.17.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 22 Sep 2026 17:16:07 +0800
Received: from RS-EX-MBS2.realsil.com.cn ([fe80::d17c:2fd0:cf8e:635]) by
 RS-EX-MBS2.realsil.com.cn ([fe80::d17c:2fd0:cf8e:635%9]) with mapi id
 15.02.2562.049; Tue, 22 Sep 2026 17:16:07 +0800
From: =?utf-8?B?5ZGo5a+F?= <zain_zhou@realsil.com.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Vikash Bansal
	<vikash.bansal@nxp.com>, Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	Lakshay Piplani <lakshay.piplani@nxp.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mfd@lists.linux.dev" <mfd@lists.linux.dev>, =?utf-8?B?546L54Kc?=
	<wei_wang@realsil.com.cn>
Subject: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtSRkMgUEFUQ0ggMy80XSByZWd1bGF0b3I6IHJ0czQ5MHg6IEFkZCBkcml2ZXIgZm9yIG9uLWRpZSByZWd1bGF0b3Jz?=
Thread-Topic: =?utf-8?B?5Zue5aSNOiBbUkZDIFBBVENIIDMvNF0gcmVndWxhdG9yOiBydHM0OTB4OiBB?=
 =?utf-8?Q?dd_driver_for_on-die_regulators?=
Thread-Index: AQHdSOfKLIR/IAtYvU2nf5+oMdLbTLbW6X4AgAF7WJCAACgwAIABxRsw
Date: Tue, 22 Sep 2026 09:16:07 +0000
Message-ID: <d04e4ab9469c4d0fbb0425030acc2e9f@realsil.com.cn>
References: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
 <20260920100501.4091351-4-zain_zhou@realsil.com.cn>
 <58c3ea87-b7df-4c68-b22b-5102c158d5f7@kernel.org>
 <fe92f1275efe4451978fc473cbad39dc@realsil.com.cn>
 <86d282f5-9221-4a62-85db-2d46524dd817@kernel.org>
In-Reply-To: <86d282f5-9221-4a62-85db-2d46524dd817@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
x-originating-ip: [172.29.17.210]
MIME-Version: 1.0
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_101700_189745_BC880202 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

On Mon, Sep 21, 2026 at 04:07:02PM +0200, Krzysztof Kozlowski wrote:
> I missed the __free, but then why do you declare __free variable with
> NULL as constructor? Don't grow this pattern. See cleanup.h (or
> discussions on the lists).

Thanks for the clarification. I will initialize both __free variables
directly at declaration in the next revision. I also reviewed the rest
of the series for similar cleanup issues and found a couple of functions
that mix goto-based resource cleanup with guard(). I will fix those in
the next revision as well.

Best regards,
Zain
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
