Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B097CFD31C
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Nov 2025 17:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lNQcXN6bNVnJVMEz3qljhs5SZ2nPsgd5OrSG7RKd+Pk=; b=S6JXzk6HQ+B3cB
	DLV5QGAQroLjxDwhoERM9PbB/2B42fge4YB6PYl3KRHUjFXjqeEu/g9Vs9QxjZXhPN9F3xLgyHQgG
	ckMMOySjiQZH2Znu1dXDTVyFtjkolh5bMNiaUpdjeAgOswoceouNGjRka/TyvumpUG5o7k6rUP0MM
	gdMsvM/aXbstRagWTw3PY2lpIOapqBTI2/1CqqPcTNLqQtpDJUXj2NzsTzqKOb70PqgYmoepmyLqs
	kn5fdWM5GZiVHAlTQkDLKvwFuSugY37d6631q9A2PTDJ5YdS8W8I8l6FRoxtyiBdle+U0jX1kvL/A
	mfLXkYFXJLFmHxO3VPyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNaev-0000000C7xo-3k6y;
	Mon, 24 Nov 2025 17:47:29 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNaeu-0000000C7xK-0Sqv
	for linux-i3c@lists.infradead.org;
	Mon, 24 Nov 2025 17:47:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZK1C7C45y55EkhyRzvqjiiFX/DvnyGZjnV+X74Qn9q9YvlnIPncdECOapkNQNg7ic185jVJeA8wv/X5YuHRNTZKXadZGjLv8dxip8Dw6GS/WUKAHcX/mCeDD9Kun4I7nEqMr3qrxsOvecWv3DfOPTUlm2VSwPeYk1gZQjFuUYuLa3HyYopffrOtrTGpToo9+X/5BEwGiVn7JD+bhqzKMqTyQBoArlTa/gpDcJt3H6n9zO+JDKFkqd2Z7gh0RNoJp+z37MxCgoPGjHEG+Lv1+46Mbl9hrLq7YLqL4qEC6Z15sN62PTnJRDpuHZzW4+jVpoZ4yAkC5c/sJSyTBU+0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V76WYwquiA7p2jX5O3Eev/CH14gv2BBBO6oqA8ipkKs=;
 b=T/uVKLY11qPjyYo/UrpoDJ0IgF4S1ipiiF4Hxvw3YqsBZEpt5hCNKQj1ZJe8iJOR+dViaWk/20GQSQtqRVbL3lklWWLbJ11tSWg8izyyjY5o+f5vUAeByX3iOU11MFj3L6wYpmicOcbWowSD2O2Vqi/3xJhEtA2yN6SBYlK04PbdsH+jXGZw7ujh/JEx8r+mSFRuBlXgTW37huHtBGneinxWUsqF9f01xC4D4+3nl1l47ksq7Pv7ZNKHKPaHeAiWnt6RS2rXHDbZdkKGAi1EDcI83Yrqfo3O6UOCViysMsrCuI78AXijIPJFRNZvqfiLyESLZHI7NDia98O9UDNiaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V76WYwquiA7p2jX5O3Eev/CH14gv2BBBO6oqA8ipkKs=;
 b=QKAw23d5LJy20HrXQE3GqHEU+TssEKhn+0mscw1CaN4vNTyVOr2Le4KTNe0H8jSUbAQ2SY/PSEQs5n6Rqoe2Lyw5htdRmafQBAJl1/WYQreT7T5FKsa/IuV/Jlj32wLlUUFN29fLiNAHM8MORk+uXhEeuQFV8RpZ7MeTYVkyZH6LP6KUhHRhAYVk75NDbc662lpCTt8ijefTWiTRsgV0qRW5inthSxyq67InN7Zads9NdvPfxCgvbNIY4HXsLudV5Py69RZBsEctesFAjuzJmNWDcATWSf0mQdQB3+comqV9WZ2eiKZzp0gLboJQvQ8La7kuK9jNBjAI1KlC/f5LGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAXPR04MB9490.eurprd04.prod.outlook.com (2603:10a6:102:2c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 17:47:24 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 17:47:24 +0000
Date: Mon, 24 Nov 2025 12:47:17 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] i3c: add sysfs entry for Device NACK Retry count
Message-ID: <aSSaJRKsO1TYhUEZ@lizhi-Precision-Tower-5810>
References: <cover.1763747151.git.adrianhoyin.ng@altera.com>
 <6ad1cc6cc835ddb01cc179f91cb9a8bd2eb5153d.1763747151.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <6ad1cc6cc835ddb01cc179f91cb9a8bd2eb5153d.1763747151.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: SA1P222CA0193.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::10) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAXPR04MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: fd22f881-5a74-43ef-91cf-08de2b818515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?naKiFkmQ40yIxbdYNquNtd5Nha/qhK3EPtyF8YxYH90QHpSZpwzrqRMSADQr?=
 =?us-ascii?Q?uk+N8SYjk5y5Hv1JR81qHaAVY99xGNkIFfntDJkslRFUtAW56hL7S48MMP46?=
 =?us-ascii?Q?bAEod3XryQcbOPINHT25LTMk82fW1xLgRZWVU4gZFJopv/YJXjP3JaxuSmbw?=
 =?us-ascii?Q?u0eQcj9QZf66me86n2QyRIQ5ncChJY65Pm+yQI2n8QUVB7b2mIbpbTHJo4im?=
 =?us-ascii?Q?oQk34Yc2gfkFM2ASrKZEV+8z9q/mZZHd7K5pRgAp0jmNHCgfWMvHkqv5gMEr?=
 =?us-ascii?Q?fg8UtUgeYCqdXUCJS4pDjnMNi0B0vF+31xyTVApZsnN3jgxXDVICRi9OMyp7?=
 =?us-ascii?Q?pr1SQQjrN41SYFvjx2GxtCrH4sAFRiW4mZBGtBIrZXiiKMUdnBXnxh8DM4Qr?=
 =?us-ascii?Q?p8ZEXM2Ai5lEmsLClQvwx5KIctE8X/EGMTi6sS+X70T2RW4YsteZodDrFNdj?=
 =?us-ascii?Q?WTKjtRHv+9oINNe0MPFjins+4UiYVKdVUBG/BgmgznrM/YsF1kkFOy0gBj70?=
 =?us-ascii?Q?tKxh1t9rxNpj7GQOmYtQA9QL6SVrdpuMuBuDOzoBW0faBODACSON2m88EotV?=
 =?us-ascii?Q?4mD2MB9VzHmyCMjs7reIWBDAQmqyG6hBAoTfTTkjF1xV/X1E/uwccP9XDB9c?=
 =?us-ascii?Q?FbPW0dJcZ6By4/KPPvhQQjTCLXaKe9vcx8pVgLORiuvHNTdV8U1hgrT40MO0?=
 =?us-ascii?Q?cWxaE6i9BTUVA8l89tCpwgTIoDXGkkdvb6/fuXq720qP1B4eGWq+xswGdL+g?=
 =?us-ascii?Q?AQk/QGWR5Jpe4dENHn58wj25m27XVdnPi9A1UONngT0bRyImC6CKJNgYYwgu?=
 =?us-ascii?Q?Aag2r+rIdlXtfzAM8zMthOul4PYL6ECTtOsd9xe4MLcpcIB30XmJj5WX5Ty+?=
 =?us-ascii?Q?e0bqWWGD3QU7+R5QQ3TXgeMbuiz2FvGLDeTb/If0uPFS5pvoMSQLVW5q2zHZ?=
 =?us-ascii?Q?wFXht1+inQQbCvE3QgxVK1KGGBsPAW3m3W/dDwf1nT2KZOK5UVOmQNtLBaW3?=
 =?us-ascii?Q?S+hQ2sbqPmaoOYUBOBSlhUeaaz45Cq9A1CGJInBvxdoR0NRFBqHnvf/Z3D7r?=
 =?us-ascii?Q?nuSs2On01kiok0dK58jr5intNOum5BnmzBzqYYA1kRvJXQuhe6i0n1woY/dd?=
 =?us-ascii?Q?yhpQVtNgpfuaXMAFz7dn7aiA6e9cxUmHEJ7w/lAi3tmtBJNnmaajoa9U5S2X?=
 =?us-ascii?Q?Rddlpgevh1XRGUfKV05z4kniRHQxrii4+MENG90FEGzu9GtLkl6L7jZt2Dd/?=
 =?us-ascii?Q?A54IbF9gH43I4HpV3SiFEA1v4fMLKtmU30ghAJj3uCpixHSFYGxeP1h094qB?=
 =?us-ascii?Q?9sDBX9fF7A8TReBHwtJ1NpQSAC0UD82rFl8doEyGH3v7a3xyGkvbcI8tn9Ry?=
 =?us-ascii?Q?2Ngbmx2ZuDSxeZqWlNzMXQ6HqyvVGRQeqN1M6wyNDszU0zg+snqQD7pJs8i4?=
 =?us-ascii?Q?l49yhnr+EjaTmwAtWWDHturGk/YZ2dMcNdcw4rBca4wDL/wooATIaSB/jtUd?=
 =?us-ascii?Q?f71hQra7OqL9R7iXZTXHbQTivC0EIiTFJpj+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ekuew2n9T8AUbG1+Tz63zUaV6tlq6DjrwBAK1+aZTO0TdZWzUzIoTeTIRttN?=
 =?us-ascii?Q?IGG52SYnc2h4D2KDu/8+IRsryo/6Ao8xmsDqkmvHkylteU6TWJV1LvCYNeVT?=
 =?us-ascii?Q?xVdqm0vBNAHP8nWB+VFAz3gOlKwvhKF5Lx3He6/u+yKM9URCjtjOuEpXPntt?=
 =?us-ascii?Q?k/4SEWjRYXwee+sYC+RMQ8WVLBgcYpuT/bTIHujIHOE41VkqtUns7TovvP1y?=
 =?us-ascii?Q?Vli2vKKV3HipW6ViNRel85xqSHgaGMdHOcs3BtRU11NZE9PlIOMPN9kI8UWN?=
 =?us-ascii?Q?fltTNs+LAxBwWEjrxAHeWlBYEmpGD+ZnQna1Ad2qc0WLSUd5UATOa6ROGFJp?=
 =?us-ascii?Q?NJxlaleaYqzZT6qPjhIJQ0FBfX15bYlVDofLQJgJdkbQHVueMxy3fgea/XHT?=
 =?us-ascii?Q?yOtsOS4cLd/fTUGVbsVS/vAUi95ZGrDhlfFw4Q0vygnSSM7/Mh3BtiOLY/g6?=
 =?us-ascii?Q?G3m0XJHK6Q5NE+Xd2pDBNXQXIezKptPH+pMQveonKYUhkbZtik5s4VAvQBBq?=
 =?us-ascii?Q?4BbkgaFzoN9O/zs5IaoOHz+cktajvsNb/HsCgahphDw6eiiIsAKaP7ldJ89k?=
 =?us-ascii?Q?F/lfl4q2FraE2XXYWpTgivZJA7pkkHhXdTkgIRHk6nhswH21r2KkcaciWZmc?=
 =?us-ascii?Q?NoGIv1m36vvTx05U80KWTdehVPkGoP1r1OHU288DuP0dpYhyyQKvJORiDqaY?=
 =?us-ascii?Q?AeCH9g3tNmfHCkA7YXMgF+n81GEOMaU49fnf44qdZv4c+6r8d6irfE8FOqUF?=
 =?us-ascii?Q?dzBUJmk53BaQPtF/7CVEdynGrm1lfD1aTcb7JJTsiECjFksz3vX/pArrTVOE?=
 =?us-ascii?Q?naIKmFD34xtXiuu+dM/72yf+HajysGR0yo2mCM9O3bBNEJciQWq1Y2lnU/4o?=
 =?us-ascii?Q?WrUhyRIrSpcKiBV4x7HQTvq4sdqZIeKLIpnazO1HaG/dIkrSaNT4uEM9GZsl?=
 =?us-ascii?Q?SUvcn1GFP3t6+cqZReqPPvZnpROhzgoYwZd0hsoNAB1RelNhUToXdwIUzZXe?=
 =?us-ascii?Q?R+RKlYIY+Rq9jGta4MZ8ikTRysEypDMcn/OptaIvAOdMyCEGG2QrXhzGtkmn?=
 =?us-ascii?Q?iKAKN+FDKFrUmOC0t9sAP0mwMvYDEf3KFl5L9rixZVEdyr9yFSMslhOiIH0/?=
 =?us-ascii?Q?YeiqpTwHtYvFuIq1gcjUtwqn+UWp+ui2JYaE3ki5IpLP6hV3PJCtiCTLUCNn?=
 =?us-ascii?Q?pwz9y/jBkr+dU6COV/7Ura1tjCdxbf3jo0A8yEveIHY3fE18eYNipXjvuIxo?=
 =?us-ascii?Q?kKXtK1ork23IDqwEr6V/47gCqV+pNR5nA/IyQYQgKW6hLLmzTUT2cGQl52XF?=
 =?us-ascii?Q?LOXNaQq/wSUjEjzG3gsXIvXIKbCkHTNrrmRefbKnNRD7SKLOy/7myag+Jl4b?=
 =?us-ascii?Q?6eN7r39Oy9F8ARbe43UhVZKBB15ps+ABDaDaawMngaJbjseCEDxjw45+j6U/?=
 =?us-ascii?Q?brFmaWhilX3BXF7mntytOdEdPPikc8JF1vjE6kzI/CNqcdakDEcDYSKzOKqA?=
 =?us-ascii?Q?GUt0+/zC3kV1AIvReFYM3HL389kt3B04+axp796kZyiqF9lKeF9dsdQvmSaO?=
 =?us-ascii?Q?5DH6tyfTS5oxmnWQJuRO+lnlftmwmHCaDhhGaCnV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd22f881-5a74-43ef-91cf-08de2b818515
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 17:47:24.2901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6tMq3L3Uje45k2fRjhK3CBGyN2lbW8pAQIcgyN6RJUg7m+dtnDVA8cR+B9MFeDThPHWv3IhLNPndOlAIBE0gqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9490
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_094728_154174_4ACF5125 
X-CRM114-Status: GOOD (  15.68  )
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

On Sat, Nov 22, 2025 at 02:00:39AM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> Document sysfs attribute dev_nack_retry_cnt that controls the number of
> automatic retries performed by the I3C controller when a target device
> returns a NACK
>
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  Documentation/ABI/testing/sysfs-bus-i3c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-i3c b/Documentation/ABI/testing/sysfs-bus-i3c
> index c812ab180ff4..0b8a0c223f4a 100644
> --- a/Documentation/ABI/testing/sysfs-bus-i3c
> +++ b/Documentation/ABI/testing/sysfs-bus-i3c
> @@ -161,3 +161,15 @@ Contact:	linux-i3c@vger.kernel.org
>  Description:
>  		These directories are just symbolic links to
>  		/sys/bus/i3c/devices/i3c-<bus-id>/<bus-id>-<device-pid>.
> +
> +What:		/sys/bus/i3c/devices/i3c-<bus-id>/<bus-id>-<device-pid>/dev_nack_retry_count
> +KernelVersion:  6.18
> +Contact:	linux-i3c@vger.kernel.org
> +Description:
> +		Expose the dev_nak_retry_count which controls the number of
> +		automatic retries that will be performed by the controller when
> +		the target device returns a NACK response. A value of 0 disables
> +		the automatic retries. A max value of 3 can be configured. Exist
> +		only when I3C constroller supports this retry on nack feature.
> +
> +		Valid values: 0-3
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
