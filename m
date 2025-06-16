Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF55CC71135
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Jun 2025 04:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jAVszsapmG3lz9fPHNypPHahen+dhKLLitHU+BLeKlc=; b=t/8HMgFJbZRjsZ
	Han9gK7wTSQ934qbbAv69hddMTF3QwjLRuM4EtSEa9HPMx7eroAMOOhQq2qYZXGJozuekLr0Vbvq7
	3rZKgkkfGxn0oXpZlQGzedF1BKM7+ltOtZpRB1bK1791upHYV26DduF435rIyJIFZQNJ5HpgsyVB6
	llaS/5yafQM0X5IODMyJFIdVcgJY9O0pYQOCIaLtzJSa/M6KJEUjsTwVvewdqOafImZ2JCdU8G62x
	Av1ydjOGs7gI5owdJ5/nIBHw2NmO8LhI/fo/1JYS6veEMK78/riIHCmTZzLZ+9+FJGM2bFAtCyBzN
	Nsz2sd71alEszMDqyI6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR1Gi-00000003KOS-2WGZ;
	Mon, 16 Jun 2025 04:16:24 +0000
Received: from mail-bjschn02on2072e.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::72e] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQzdx-00000003A5f-0R5u
	for linux-i3c@lists.infradead.org;
	Mon, 16 Jun 2025 02:32:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNLWwsZ3op5bRP0cvF7RuKXTKFYDtbAyo1ip2j5GBV5fWhSCWjB6DgvkK8LTAIeCDIyKIcmF66khVNs+WzVNU8S6d1XjtKWT9Yn8wffVv1qQmXH6QEw8rY01zbQgEPZDwIHTjc2KcaNrV1aAJEc9RqBgQ5XdQs2MPgbFxGP/LUXYQr/Va7Ik+SoK7GsKpgtUaW5xRDa/Wb2RnEymJ1Xlq7r4ik43b8yMWIUiHWNqZAaV0yhOiSi5r+NAvi14Oq+ZxsmqYOSjFouK5hwEHDiw6vq6gnEFxI4/EFFoGhDPgiAUNdojVFCA3ue5jrczO2FcrQpBZQVHcJTOjFWKJdUR8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1fDAMVH7WC9dZ5u43YtIjZQAd1Qy6CWETnT/2zNt9s=;
 b=U1tyqWm0nq3iEKfaUSowcdXKqWATWHMGIhGl/BSacZKcCUjS23w7SvTQebpCN947NY31aKROp/M/DDwwoOuMWoVuTj7sqVvzWIyFtX66IfhDtt8x5aoQVASxwPFn4FzNekNWC3wGNbwboCTwSI3Xkg6s3dzVz8RnPbj0NAhtGgV1rd83/UbsZGEbus7nMMdX5W3VWZxtoRKf4Z9SHwxu9jmA9MAWAhEsJ305C1q7Zb9SQMS4Egv5EAPSL9NFJpBVYxZVwHUVJMminmdFe1jy9ZxNasFZUQN/j9KjZCltOm+Ro1Ph3EerzhXLPcHo9agvP2HX6Hrpq4dg0Vq25AGLxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0763.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:22::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.42; Mon, 16 Jun
 2025 02:31:59 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18]) by SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18%7]) with mapi id 15.20.8792.044; Mon, 16 Jun 2025
 02:31:59 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Subject: Re: [PATCH] i3c: ast2600: Generate T-bits to terminate IBI storm
Thread-Topic: [PATCH] i3c: ast2600: Generate T-bits to terminate IBI storm
Thread-Index: AQHb2o76ryA94TBY7k+UDIrabhzuH7QFGI2A
Date: Mon, 16 Jun 2025 02:31:59 +0000
Message-ID: <535d8707-893e-4e5b-96c6-a59e32b3773e@starfivetech.com>
References: <20250611040203.487734-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20250611040203.487734-1-billy_tsai@aspeedtech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SH0PR01MB0841:EE_|SH0PR01MB0763:EE_
x-ms-office365-filtering-correlation-id: 3af403c0-83ee-4376-bd30-08ddac7df89a
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info: sU+qBpw+D3KzfCw212i12/eddiOnnDuhVKCToQ4HtjKzDdCiTW+2n1FG1fbsM9wLIanolyG5iMTv2FJe3q9rsIdUySR+A2ALxcgGRSpW/QlfXXcuhkEKXDUfNxJVJPwqE/iL75zARF6gOvhauShjV9esegDUhRkR4F6mbi/ri4UJ4A+NV4ohHg0bMzilleE/9mAjufLNmxyD08BT+sKVaS1inOMT9LcNt4bh4HyhYbxm7g74aS0/E2RyurszRtEwbCq3H3I+P9y80SpKuBa1j+B1B23l9BsD8x3jmIwg8/oMgXE8Vv64NyfIIjXu9cc+THR9MJLiLl3Ni0jWMFE7SDZqYQW2SeBi4UGw3YnooOl/338k0gHf0vvd+Y43eraE6T+m40txXCIGUc2eiO1MvV/HQePgRizaysHmMMA/QVy0Mm1VGSOiAmjmrogvpw4ah/vueB4HT4/pW3sU6nmToLUaD+oH20WuzQXyADzP3Q0QbQFjblm2UXJ34yOTj7660SkAgprV8YyAzAab5R1MhEVMKed0IyWXWHAfT4ZesdjNCQ3j0uHAlpVzWUUDocUZs9SfMNnkPN7Vy0GGsowg0j9b0lDI8otfM2JKyOvZdu8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1c4TzloU25pV2pvLzRDZ291bmlGK01iSnpwMEFCMERhei94ZTVMN3J1Mmpy?=
 =?utf-8?B?VG9MSXZmRDBWZjFhaE0rM1h2NU02UStmVzZHb2FiOVAwNUZ5YzQ5VjBTdnBo?=
 =?utf-8?B?NTBsSEZhN3kwMGI4cjlYdXR1QUtHTTdiZlhWdG1abjJNWVZ5VzgvRm1ZL0ZP?=
 =?utf-8?B?MkFXbW85cmloWjZ5bS9kZXhxMTJhbjhVbytac1RjZHhTd25qMEdxdWdEWlZo?=
 =?utf-8?B?akpPcnY0eDhuOVRLN2UzNU80N05UNGhBdU03Rng5YmFvWkNyNHpvbHk1T3ls?=
 =?utf-8?B?YTc5WHBZczFSakZFR210Y1lvQ3BrNXB2NWRsdzdkK05oS05RVWRjMGFudGg3?=
 =?utf-8?B?RTVicGNsb1pDcU0wdUVKdDBXYzk5T3YyQVNuc1E2Vk5YRitQSEpZWlBNN1lN?=
 =?utf-8?B?TE9GbkxjU1Z1SkwvU0c3cmR3VG96eERZSTd0dnVnQmszOHdWcFZnZkxSamF3?=
 =?utf-8?B?Q1l3b3JVTFRCc2h4SVlWY29uazVyaGZLSXBKcWFjOHlOUHZoLytwa3AvS3Fm?=
 =?utf-8?B?cEg4bnlBK1dRbmxma05DcjQrNTM3dkNzSEk4NHd4K2lHTnI2VjNMSzhNa1Az?=
 =?utf-8?B?OFZuQkNhaG1ZRVRVeDYvZnJ4NWM0cFdrVnJhUkhKYVNETHRkYUhIZGMxRlAw?=
 =?utf-8?B?VU9GK0dmcmpidHRBbFhJb0d6STdYQ29OQ0dMVUw3S0ZZUjRBMitzbWJmWkxB?=
 =?utf-8?B?ei9YWTJ4M0F1dFJRRnFLeC9odlRnZ0pheVgwOUYremJoOTlGS01uQ09FN2Np?=
 =?utf-8?B?QUJhRDFpNEw1U2FSRWVmTEVzQWFkZm00RXNsRDZqTnhhNld5R0ZVVk8vS2NM?=
 =?utf-8?B?WmZPVkJ0d3E3OFlBZGM0NjNXN2o2Mk1VUTJzTmJ0Z2NYdk1YOWdLanJXcXFa?=
 =?utf-8?B?UFhvU21tcjhKSG95eEJRT3dKWENBYWZZRm8zVEVYamRpRVhJUHZnci80eFE4?=
 =?utf-8?B?bE1EUFFSOXBlRmc4TFdVcGxIVmFTZktaQldlQXZkbmp6R3l6WWdDOHlpNEdq?=
 =?utf-8?B?Vmd5Y3pwSVRoczN5OTZGaTVFR0xGVytsZjhoRk5QYzR1MEw3OVNFRFU2Qyta?=
 =?utf-8?B?cDhBUHl4RmdIcFJmUnhBSC90NVhLdE5KcTRoT1Znd0Q1VkQ2RGt5cEZ6MWlv?=
 =?utf-8?B?Mm5ITWJWWGwvNjNwRmRmUGZJQm5EektOMUl5d0xkcVpBOHV5SW1HNHVtZTdW?=
 =?utf-8?B?SEQyYUIralkvNU1ZRkFZUkpxeWFQQUxMRWhQZkp3U3V4WUdwYS9nc3dtSmpM?=
 =?utf-8?B?UkJnZHRkV2lOOFNadEVhSnYyU1hvK2QyU2NmY0tHdWJTM05SRDg5K0licnhG?=
 =?utf-8?B?VnI1UmZvWklucFk5eGp5enltRmF1UTRORDUraEFWWmV2TGJibWphTktxVVVr?=
 =?utf-8?B?QTB2eWJxdjlSc3BtMjd4Ris2Q1AweGsrNzl6Sk9iTkpyZ2pTNk92cWdsUnNB?=
 =?utf-8?B?RVEwQk5pcU1wTk5KT1FoNzdTRXVIbWJvdHZzWFBFcTZzUkhjc0VIV1RIOXY1?=
 =?utf-8?B?amMvYjRlQmFyK2ZoVjZXUzZ6UzA2cEUrOTFkTWRKY0drTXc1R2QvamJMS3I5?=
 =?utf-8?B?NWQzQ2lKS0VBMFMzeW9LY211SVg4VnVRc3NKYWdWU1VwRU1RZEpNaUQvVjZO?=
 =?utf-8?B?NW44V0FXVzM2S01LbjMwQzdZS3BqVXpVekV2VW9iWmdlWDVENTF5SEhpSGJp?=
 =?utf-8?B?NjN2UEh3WVNSL0ZvWnpUQS9rbG16bHRFVC9Jb3BFSDJJVm9uNjQ0ZDVVeVVN?=
 =?utf-8?B?NWRVVG9zSENYTGhhRUpEdWRJT0p3b3N3N1JKOTZGOWZHSldEcDJxZlFSQU1Q?=
 =?utf-8?B?OFNHUllJalBGYWpSUkdDYTZaUEV6T1ZjWFVsa2hhYldhdUY3enE2UEYzNEw3?=
 =?utf-8?B?bUJuSkw4d2dLNW5GTzVneVJLbUR6WWFCMkJjbTV4ajRNWVJYMjh6S3hYTGp3?=
 =?utf-8?B?NWF4TmdWRW5JSTFudEQ3K25OTmllMUQ5Z2JxcTZmVVQ2Nkg0azF0b2ZGRXBz?=
 =?utf-8?B?cWFmSHNvdFJQZ3R3Q2gxNm5MaXJMc0NTd1FJTVYzdmU0b2hWSjV1MWcyVkw3?=
 =?utf-8?B?L2xFRGJ4WE5RQ1ZmaDhsZEtqZjFCUitrbktCNWx3aVlHN0gyZHlJUDd5NzVT?=
 =?utf-8?B?VU1Ca3FKRW9yTnM1WmhnV2RoZEU4VUdvLy9QSEM3WGt5aEZTT2tGK0s5akha?=
 =?utf-8?B?Z0E9PQ==?=
Content-ID: <66D937A006E2A0498F03014ED5D880E5@CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af403c0-83ee-4376-bd30-08ddac7df89a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 02:31:59.7751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 748HhOLD35Fq9GGI60Ii1oN9vEQfJjO9CRqCfwXnd1Ec0MTnbPK9lIgLkjDsv05eAAIgcWmH3ZFx6UijNv0afjjsbVyRS7kTg5h5gbm06As=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0763
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_193217_297139_21E57E57 
X-CRM114-Status: GOOD (  22.55  )
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

On 11-Jun-2025 12:02 PM, Billy Tsai wrote:
> Under certain conditions, such as when an IBI interrupt is received and
> SDA remains high after the address phase, the I3C controller will enter
> an infinite loop attempting to read data until a T-bit is detected.
> This commit addresses the issue by generating a fake T-bit to terminate
> the IBI storm when the received IBI data length exceeds the maximum
> allowable IBI payload.
> This issue cannot be resolved using the abort function, as it is
> ineffective when the I3C FSM is in the Servicing IBI Transfer (0xE) or
> Clock Extension (0x12) states.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/i3c/master/ast2600-i3c-master.c | 60 +++++++++++++++++++++++++
>  drivers/i3c/master/dw-i3c-master.c      | 14 ++++++
>  drivers/i3c/master/dw-i3c-master.h      |  9 ++++
>  3 files changed, 83 insertions(+)
> 
> diff --git a/drivers/i3c/master/ast2600-i3c-master.c b/drivers/i3c/master/ast2600-i3c-master.c
> index e05e83812c71..6ac0122474d0 100644
> --- a/drivers/i3c/master/ast2600-i3c-master.c
> +++ b/drivers/i3c/master/ast2600-i3c-master.c
> @@ -33,11 +33,28 @@
>  #define AST2600_I3CG_REG1_SA_EN			BIT(15)
>  #define AST2600_I3CG_REG1_INST_ID_MASK		GENMASK(19, 16)
>  #define AST2600_I3CG_REG1_INST_ID(x)		(((x) << 16) & AST2600_I3CG_REG1_INST_ID_MASK)
> +#define AST2600_I3CG_REG1_SCL_SW_MODE_OE	BIT(20)
> +#define AST2600_I3CG_REG1_SCL_OUT_SW_MODE_VAL	BIT(21)
> +#define AST2600_I3CG_REG1_SCL_IN_SW_MODE_VAL	BIT(23)
> +#define AST2600_I3CG_REG1_SDA_SW_MODE_OE	BIT(24)
> +#define AST2600_I3CG_REG1_SDA_OUT_SW_MODE_VAL	BIT(25)
> +#define AST2600_I3CG_REG1_SDA_IN_SW_MODE_VAL	BIT(27)
> +#define AST2600_I3CG_REG1_SCL_IN_SW_MODE_EN	BIT(28)
> +#define AST2600_I3CG_REG1_SDA_IN_SW_MODE_EN	BIT(29)
> +#define AST2600_I3CG_REG1_SCL_OUT_SW_MODE_EN	BIT(30)
> +#define AST2600_I3CG_REG1_SDA_OUT_SW_MODE_EN	BIT(31)
>  
>  #define AST2600_DEFAULT_SDA_PULLUP_OHMS		2000
>  
>  #define DEV_ADDR_TABLE_IBI_PEC			BIT(11)
>  
> +#define IBI_QUEUE_STATUS		0x18
> +#define PRESENT_STATE			0x54
> +#define   CM_TFR_STS			GENMASK(13, 8)
> +#define     CM_TFR_STS_MASTER_SERV_IBI	0xe
> +#define   SDA_LINE_SIGNAL_LEVEL		BIT(1)
> +#define   SCL_LINE_SIGNAL_LEVEL		BIT(0)
> +
>  struct ast2600_i3c {
>  	struct dw_i3c_master dw;
>  	struct regmap *global_regs;
> @@ -117,9 +134,52 @@ static void ast2600_i3c_set_dat_ibi(struct dw_i3c_master *i3c,
>  	}
>  }
>  
> +static bool ast2600_i3c_fsm_exit_serv_ibi(struct dw_i3c_master *dw)
> +{
> +	u32 state;
> +
> +	/*
> +	 * Clear the IBI queue to enable the hardware to generate SCL and
> +	 * begin detecting the T-bit low to stop reading IBI data.
> +	 */
> +	readl(dw->regs + IBI_QUEUE_STATUS);
> +	state = FIELD_GET(CM_TFR_STS, readl(dw->regs + PRESENT_STATE));
> +	if (state == CM_TFR_STS_MASTER_SERV_IBI)
> +		return false;
> +
> +	return true;
> +}
> +
> +static void ast2600_i3c_gen_tbits_in(struct dw_i3c_master *dw)
> +{
> +	struct ast2600_i3c *i3c = to_ast2600_i3c(dw);
> +	bool is_idle;
> +	int ret;
> +
> +	regmap_write_bits(i3c->global_regs, AST2600_I3CG_REG1(i3c->global_idx),
> +			  AST2600_I3CG_REG1_SDA_IN_SW_MODE_VAL,
> +			  AST2600_I3CG_REG1_SDA_IN_SW_MODE_VAL);
> +	regmap_write_bits(i3c->global_regs, AST2600_I3CG_REG1(i3c->global_idx),
> +			  AST2600_I3CG_REG1_SDA_IN_SW_MODE_EN,
> +			  AST2600_I3CG_REG1_SDA_IN_SW_MODE_EN);
> +
> +	regmap_write_bits(i3c->global_regs, AST2600_I3CG_REG1(i3c->global_idx),
> +			  AST2600_I3CG_REG1_SDA_IN_SW_MODE_VAL, 0);
> +	ret = readx_poll_timeout_atomic(ast2600_i3c_fsm_exit_serv_ibi, dw,
> +					is_idle, is_idle, 0, 2000000);
> +	regmap_write_bits(i3c->global_regs, AST2600_I3CG_REG1(i3c->global_idx),
> +			  AST2600_I3CG_REG1_SDA_IN_SW_MODE_EN, 0);
> +	if (ret)
> +		dev_err(&dw->base.dev,
> +			"Failed to exit the I3C fsm from %lx(MASTER_SERV_IBI): %d",
> +			FIELD_GET(CM_TFR_STS, readl(dw->regs + PRESENT_STATE)),
> +			ret);
> +}
> +
>  static const struct dw_i3c_platform_ops ast2600_i3c_ops = {
>  	.init = ast2600_i3c_init,
>  	.set_dat_ibi = ast2600_i3c_set_dat_ibi,
> +	.gen_tbits_in = ast2600_i3c_gen_tbits_in,
>  };
>  
>  static int ast2600_i3c_probe(struct platform_device *pdev)
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 611c22b72c15..380e6a29c7b8 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -158,6 +158,14 @@
>  #define DATA_BUFFER_STATUS_LEVEL_TX(x)	((x) & GENMASK(7, 0))
>  
>  #define PRESENT_STATE			0x54
> +#define   CM_TFR_ST_STS			GENMASK(21, 16)
> +#define     CM_TFR_ST_STS_HALT		0x13
> +#define   CM_TFR_STS			GENMASK(13, 8)
> +#define     CM_TFR_STS_MASTER_SERV_IBI	0xe
> +#define     CM_TFR_STS_MASTER_HALT	0xf
> +#define     CM_TFR_STS_SLAVE_HALT	0x6
> +#define   SDA_LINE_SIGNAL_LEVEL		BIT(1)
> +#define   SCL_LINE_SIGNAL_LEVEL		BIT(0)
>  #define CCC_DEVICE_STATUS		0x58
>  #define DEVICE_ADDR_TABLE_POINTER	0x5c
>  #define DEVICE_ADDR_TABLE_DEPTH(x)	(((x) & GENMASK(31, 16)) >> 16)
> @@ -1393,6 +1401,8 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
>  	unsigned long flags;
>  	u8 addr, len;
>  	int idx;
> +	bool terminate_ibi = false;
> +	u32 state;
>  
>  	addr = IBI_QUEUE_IBI_ADDR(status);
>  	len = IBI_QUEUE_STATUS_DATA_LEN(status);
> @@ -1435,6 +1445,7 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
>  		dev_dbg_ratelimited(&master->base.dev,
>  				    "IBI payload len %d greater than max %d\n",
>  				    len, dev->ibi->max_payload_len);
> +		terminate_ibi = true;
>  		goto err_drain;
>  	}
>  
> @@ -1450,6 +1461,9 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
>  
>  err_drain:
>  	dw_i3c_master_drain_ibi_queue(master, len);
> +	state = FIELD_GET(CM_TFR_STS, readl(master->regs + PRESENT_STATE));
> +	if (terminate_ibi && state == CM_TFR_STS_MASTER_SERV_IBI)
> +		master->platform_ops->gen_tbits_in(master);
>  
>  	spin_unlock_irqrestore(&master->devs_lock, flags);
>  }

Would it makes more sense to move `->gen_tbits_in(master);` logic to 
`if (dev->ibi->max_payload_len < len) ` above instead? 

The IBI queue would be properly flush at the end of function and don't need 
additional `terminate_ibi ` variable. If there were IBI storm, there might be
IBI coming in right after `dw_i3c_master_drain_ibi_queue` here which will
trigger another round of interrupt anyway.

Thanks
Joshua

> diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
> index c5cb695c16ab..1da485e42e74 100644
> --- a/drivers/i3c/master/dw-i3c-master.h
> +++ b/drivers/i3c/master/dw-i3c-master.h
> @@ -89,6 +89,15 @@ struct dw_i3c_platform_ops {
>  	 */
>  	void (*set_dat_ibi)(struct dw_i3c_master *i3c,
>  			    struct i3c_dev_desc *dev, bool enable, u32 *reg);
> +	/*
> +	 * Gerenating the fake t-bit (SDA low) to stop the IBI storm when the received
> +	 * data length of IBI is larger than the maximum IBI payload.
> +	 *
> +	 * When an IBI is received and SDA remains high after the address phase, the i3c
> +	 * controller may enter an infinite loop while trying to read data until the t-bit
> +	 * appears
> +	 */
> +	void (*gen_tbits_in)(struct dw_i3c_master *i3c);
>  };
>  
>  extern int dw_i3c_common_probe(struct dw_i3c_master *master,

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
